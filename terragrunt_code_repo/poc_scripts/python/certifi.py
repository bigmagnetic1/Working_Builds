import boto3
import csv

def get_security_hub_findings(profile_name, region_name, filters):
    session = boto3.Session(profile_name=profile_name, region_name=region_name)
    securityhub_client = session.client('securityhub')
    
    all_findings = []
    
    try:
        # Paginate through Security Hub findings
        paginator = securityhub_client.get_paginator('get_findings')
        for page in paginator.paginate(Filters=filters):
            findings = page['Findings']
            all_findings.extend(findings)
        
        return all_findings
    except Exception as e:
        print(f"Error getting Security Hub findings: {e}")
        return []

# Parsing the JSON structure to get the desired values
def parse_findings(findings):
    parsed_results = []
    for finding in findings:
        resources = finding.get('Resources', [])
        for resource in resources:
            details = resource.get('Details', {})
            aws_ecr_container_image = details.get('AwsEcrContainerImage', {})
            repository_name = aws_ecr_container_image.get('ImageDigest', '')
            image_tags = aws_ecr_container_image.get('ImageTags', [])
            parsed_results.append({'RepositoryName': repository_name, 'ImageDigest': image_digest, 'ImageTags': ', '.join(image_tags)})
    return parsed_results

# Writing to csv
def write_to_csv(data, file_path):
    if data:
        with open(file_path, 'w', newline='') as file:
            writer = csv.DictWriter(file, fieldnames=['RepositoryName', 'ImageDigest', 'ImageTags'])
            writer.writeheader()
            writer.writerows(data)
        print(f"Data written to {file_path}")
    else:
        print("No data to write.")

if __name__ == "__main__":
    profile_name = 'dev'
    region_name = 'us-east-1'
    csv_file_path = 'security_hub_findings.csv' # Specify the path for the CSV file
    
    # Define Security Hub filters for Severity, Inspector, and the vulnerability title
    filters = {
        'SeverityLabel': [{'Value': 'CRITICAL', 'Comparison': 'EQUALS'}],
        'ProductName': [{'Value': 'Inspector', 'Comparison': 'EQUALS'}],
        'Title': [{'Value': 'CVE-2023-37920 - certifi', 'Comparison': 'PREFIX'}]
    }
    
    findings = get_security_hub_findings(profile_name, region_name, filters)
    
    if findings:
        parsed_results = parse_findings(findings)
        write_to_csv(parsed_results, csv_file_path)
    else:
        print("No fondings fouund.")
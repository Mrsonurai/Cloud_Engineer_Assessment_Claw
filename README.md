# Task 6 - Cloud Engineer Assessment
### 1. Setting Up a VNet, Ubuntu VM, and Configuring Inbound Ports
#### 1.1. Create a Virtual Network (VNet)

    Navigate: Go to the Azure Portal.
    Create VNet:
        Search for "Virtual Network" and click "Create."
        Name: Provide a name for the VNet.
        Region: Select the desired region.
        Address Space: Define the IP address range (e.g., 10.0.0.0/16).
        Subnet: Add a subnet (e.g., 10.0.1.0/24).
        Click "Review + Create" and then "Create."

#### 1.2. Deploy an Ubuntu VM

    Navigate: Go to the Azure Portal.
    Create VM:
        Search for "Ubuntu Server" and click "Create."
        Name: Provide a name for the VM.
        Region: Select the same region as your VNet.
        Size: Choose the appropriate VM size.
        Authentication Type: Choose SSH public key or password.
        Virtual Network: Select the previously created VNet.
        Subnet: Choose the subnet.
        Click "Review + Create" and then "Create."

#### 1.3. Configure Network Security Group (NSG)

    Navigate: Go to "Network Security Groups."
    Create or Select NSG:
        Add Inbound Security Rules:
            SSH Access:
                Source: IP Addresses
                Source IP Addresses: Your IP address
                Destination: Any
                Destination Port: 22
                Protocol: TCP
                Action: Allow
            HTTP Access:
                Source: Any
                Destination: Any
                Destination Port: 80
                Protocol: TCP
                Action: Allow
            HTTPS Access:
                Source: Any
                Destination: Any
                Destination Port: 443
                Protocol: TCP
                Action: Allow
        Associate the NSG with the VM's network interface.

#### 1.4. Configure Custom DNS Server

    Navigate: Go to the VNet settings.
    Set DNS Servers:
        Select "DNS servers" and add your custom DNS server's IP address.
        Save changes.

### 2. Configuring an Azure Storage Account, Azure File Share, and Mounting It on Ubuntu VM
#### 2.1. Create an Azure Storage Account

    Navigate: Go to the Azure Portal.
    Create Storage Account:
        Search for "Storage account" and click "Create."
        Name: Provide a name for the storage account.
        Region: Choose the same region as your VM.
        Performance: Standard.
        Replication: LRS (Locally Redundant Storage).
        Click "Review + Create" and then "Create."

#### 2.2. Create an Azure File Share

    Navigate: Go to the storage account.
    Create File Share:
        Select "File shares" and click "+ File share."
        Name: Provide a name for the file share.
        Quota: Set the desired quota.
        Click "Create."

#### 2.3. Mount the Azure File Share on Ubuntu VM

##### 1. SSH into Ubuntu VM:

    ssh <username>@<vm-ip-address>



##### Install Packages:

    sudo apt-get update
    sudo apt-get install cifs-utils


##### Create Mount Directory:

    sudo mkdir /mnt/myshare

#### Mount File Share:

    sudo mount -t cifs //storageaccountname.file.core.windows.net/sharename /mnt/myshare -o vers=3.0,username=storageaccountname,password=storageaccountkey,dir_mode=0777,file_mode=0777

#### Persistent Mounting:

    Add the following to /etc/fstab:

    text

        //storageaccountname.file.core.windows.net/sharename /mnt/myshare cifs vers=3.0,username=storageaccountname,password=storageaccountkey,dir_mode=0777,file_mode=0777 0 0

### 3. Using Terraform to Automate Azure Resource Setup
#### 3.1. Process

    Install Terraform: Download from the official site.
    Write Configuration Files: Create .tf files for Azure resources.
    Initialize Terraform:
    terraform init
    Plan: 
        terraform plan -var 'admin_password=<your-admin-password>'
    Apply:
        terraform apply -var 'admin_password=<your-admin-password>'
    Destroy:
    terraform destroy

#### 3.2. Benefits

    Consistency: Uniform environment setup.
    Version Control: Manage infrastructure changes.
    Automation: Automated resource provisioning.
    Reusability: Deploy across multiple environments.

#### 3.3. Key Considerations

    State Management: Manage state files securely.
    Security: Protect sensitive data and credentials.
    Modularity: Use modules to organize configuration.
    Scalability: Plan for future scaling and changes.

### 4. Creating a GitHub Workflow for Deployment
#### 4.1. Process

    Create Workflow File:
        Define .github/workflows/deploy.yml with steps for build, test, and deploy.
    Define Triggers: Set events like push to main branch.
    Configure Jobs: Add steps to build, test, deploy, and notify.
    Add Secrets: Store sensitive information in GitHub Secrets.

#### 4.2. Key Considerations

    Security: Use GitHub Secrets for credentials.
    Testing: Ensure robust testing before deployment.
    Notifications: Configure notifications for deployment status.
    Rollback: Implement rollback strategies for failures.

### 5. Strategies to Secure the Deployment Process
#### 5.1. VM Security

    SSH Key Management: Use SSH keys instead of passwords.
    NSG Rules: Restrict traffic using NSG rules.
    Patch Management: Regularly update the VM.

#### 5.2. Storage Security

    Access Controls: Use Azure RBAC for access management.
    Encryption: Encrypt data at rest and in transit.
    Monitoring: Enable monitoring and alerts.

#### 5.3. CI/CD Pipeline Security

    Secrets Management: Use GitHub Secrets or Azure Key Vault.
    Secure Code Practices: Perform code scans and analysis.
    Access Control: Limit access to the pipeline.
    Audit Logs: Monitor logs for any suspicious activities.

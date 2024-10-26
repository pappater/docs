# Microsoft Security, Compliance, and Identity Fundamentals: Describe the concepts of security, compliance, and identity

## Introduction

As more business data is being accessed from locations outside of the traditional corporate network, security and compliance have become overriding concerns. Organizations need to understand how they can best protect their data, regardless of where it's accessed from, and whether it sits on their corporate network or in the cloud. In addition, organizations need to ensure they're compliant with industry and regulatory requirements to ensure the protection and privacy of data.

This module introduces some important security and compliance concepts. You'll learn about the shared responsibility model, defense in depth, and Zero Trust model. You'll be introduced to the concepts of encryption and hashing as ways to protect data. Lastly, you'll learn about concepts that relate to compliance.

After completing this module, you'll be able to:

Describe the shared responsibility and the defense in-depth security models.
Describe the Zero-Trust model.
Describe the concepts of encryption and hashing.
Describe some basic compliance concepts.

## Shared Responsibility Model in Cloud Computing

The **Shared Responsibility Model** is a security framework in cloud computing that defines specific security roles for both the cloud provider (like Microsoft Azure) and the customer. It helps both parties understand their security responsibilities across different cloud service models (IaaS, PaaS, SaaS), leading to safer and more efficient cloud usage.

---

### 1. **Service Model Influence**

The shared responsibility shifts depending on the cloud service model:

- **Infrastructure as a Service (IaaS)**:

  - **Definition**: Provides virtualized computing resources (like virtual machines and storage).
  - **Customer Responsibilities**: Secures applications, data, operating systems, and network configurations.
  - **Example**: In an IaaS model, a company using a virtual machine on Azure must handle OS patches, install firewalls, and manage network settings.

- **Platform as a Service (PaaS)**:

  - **Definition**: Provides a platform that includes managed services (like databases).
  - **Customer Responsibilities**: Manages application security and data, while the provider secures underlying OS and runtime.
  - **Example**: A development team using Azure App Services focuses on securing their code and data; Azure manages server maintenance and OS updates.

- **Software as a Service (SaaS)**:
  - **Definition**: Offers fully managed applications (e.g., Microsoft 365).
  - **Customer Responsibilities**: Limited to managing user access, data usage, and specific settings.
  - **Example**: With Microsoft 365, Microsoft secures the entire application and infrastructure. The customer sets access permissions and user policies.

---

### 2. **Responsibilities of the Cloud Provider**

The cloud provider, such as Microsoft Azure, takes on several core security responsibilities:

- **Physical Security**:

  - The provider maintains the security of data centers through restricted access, surveillance, backup power, and environmental controls.
  - **Example**: Azure data centers have secure perimeters, surveillance, and controlled access to prevent unauthorized physical access.

- **Network Controls**:

  - Providers secure their networks with defenses like firewalls, network monitoring, and Distributed Denial of Service (DDoS) protection.
  - **Example**: Microsoft Azure has built-in DDoS protection services that detect and block malicious traffic before it reaches customers’ resources.

- **Hardware and Software Maintenance**:

  - Ensures that core hardware and software layers, like virtualization and networking, are regularly patched and updated.
  - **Example**: Azure automatically updates hypervisors and virtual machine hosts to protect against vulnerabilities, so customers don't have to.

- **Availability and Resilience**:

  - Providers guarantee high uptime and disaster recovery with service-level agreements (SLAs).
  - **Example**: Azure offers an SLA of up to 99.9% availability, with backup options for data recovery.

- **Compliance Management**:
  - Providers align with regulations (like GDPR, HIPAA) to support customer compliance needs.
  - **Example**: Microsoft Azure is compliant with GDPR and HIPAA, simplifying the regulatory burden for customers in sensitive industries.

---

### 3. **Responsibilities of the Customer**

Customers are responsible for configuring and managing certain aspects to ensure their data and applications are secure:

- **Data Protection**:

  - Customers must manage encryption, access controls, and backups for data integrity and confidentiality.
  - **Example**: A financial firm encrypts customer data stored in Azure and schedules regular backups to mitigate data loss risks.

- **Identity and Access Management**:

  - Securing access with strong authentication, role-based access controls (RBAC), and user permissions.
  - **Example**: A company uses Azure Active Directory (AAD) to enforce multi-factor authentication and restricts access based on roles.

- **Application and Operating System Security**:

  - In IaaS, customers must patch the OS, secure application configurations, and scan for vulnerabilities.
  - **Example**: For a virtual machine running a website, a customer must ensure both the OS and web application are patched and secure.

- **Endpoint Protection**:

  - Customers need to secure user devices accessing cloud applications, using endpoint protection software.
  - **Example**: A business installs antivirus and monitoring software on all employee devices accessing Azure applications to prevent breaches.

- **Compliance Responsibilities**:
  - Customers are responsible for configuring their systems to meet regulatory requirements.
  - **Example**: A healthcare provider using Azure must configure their data handling and reporting to meet HIPAA requirements.

---

### 4. **Security in Different Cloud Models**

Each cloud service model has its own level of responsibility:

- **Shared Responsibility in IaaS**:

  - Most security responsibilities are with the customer, from securing data and OS to managing configurations.
  - **Example**: A business using Azure Virtual Machines must handle everything above the hypervisor, including OS patches and firewall settings.

- **Shared Responsibility in PaaS**:

  - The provider manages the environment, and customers focus on their application security, data handling, and configurations.
  - **Example**: With Azure SQL Database, Microsoft manages the database platform, while customers handle SQL queries and data encryption.

- **Shared Responsibility in SaaS**:
  - The provider covers most layers, and customers focus on access management and user policies.
  - **Example**: In Microsoft 365, Microsoft secures the application, and customers set user permissions and monitor usage.

---

### 5. **Benefits of the Shared Responsibility Model**

- **Enhanced Security**: Dividing responsibilities enables each party to focus on specific security layers, minimizing vulnerabilities.
- **Cost-Effectiveness**: Reduces customer expenses by outsourcing physical and network security to the provider.
- **Adaptability**: Flexible to service models, customer requirements, and organizational goals.
- **Clarity in Compliance and Accountability**: Clearly defines security boundaries, simplifying compliance, especially for regulated industries.

---

The Shared Responsibility Model provides a strong security foundation for cloud environments. It clarifies accountability, enabling customers and providers to create a secure, efficient cloud environment.

This summary highlights core concepts and responsibilities to help ensure your notes reflect the security expectations in cloud computing.
![3-shared-responsibility-model](../../Assets/SC-900/3-shared-responsibility-model.png)
[Official docs](https://learn.microsoft.com/en-us/training/modules/describe-security-concepts-methodologies/2-describe-shared-responsibility-model)

## Defense in Depth: Comprehensive Cloud Security Approach

**Defense in Depth** is a cybersecurity strategy that layers multiple security measures to protect data, applications, and infrastructure. The idea is to build multiple security layers so that if one defense fails, others remain active, creating a comprehensive and resilient security posture. It’s based on the concept of redundancy in security: using varied, overlapping defenses minimizes risks and provides depth to security, preventing breaches even if an attacker penetrates one layer.

---

### Core Layers of Defense in Depth

Microsoft outlines **seven key layers** in defense in depth, each addressing a specific part of a system to enhance security:

1. **Physical Security**

   - **Objective**: Protects data centers and physical infrastructure against unauthorized physical access.
   - **Measures**: Surveillance, access controls, security guards, and environmental systems (fire suppression, cooling).
   - **Example**: Microsoft Azure data centers use biometric scanning, 24/7 surveillance, and limited access to authorized personnel only, ensuring unauthorized individuals cannot physically access servers or storage.

2. **Identity and Access Control**

   - **Objective**: Ensures that only authorized users access systems and data, guarding against unauthorized access and insider threats.
   - **Measures**: Strong authentication (multi-factor authentication), role-based access control (RBAC), conditional access policies.
   - **Example**: Using Azure Active Directory (AAD), a company enforces multi-factor authentication (MFA) for all employees. Employees accessing sensitive data must verify their identity with an MFA code in addition to their password.

3. **Perimeter Security**

   - **Objective**: Creates a security boundary to prevent unauthorized network access, keeping potential attackers out.
   - **Measures**: Firewalls, Distributed Denial of Service (DDoS) protection, virtual private networks (VPNs).
   - **Example**: Microsoft Azure provides DDoS protection to detect and block malicious traffic before it can reach a company's resources. This perimeter protection prevents DDoS attacks that could disrupt services.

4. **Network Security**

   - **Objective**: Protects network communication within the cloud environment to prevent internal threats and contain potential breaches.
   - **Measures**: Network segmentation, virtual network firewalls, network security groups (NSGs).
   - **Example**: A company segments its network into zones based on sensitivity. For instance, database servers reside on one virtual network (VNet) and are only accessible by specific application servers, reducing the chance of lateral movement by attackers.

5. **Compute Security**

   - **Objective**: Secures VMs, containers, and compute resources by ensuring these environments are regularly patched, configured securely, and monitored.
   - **Measures**: Anti-malware, endpoint protection, vulnerability assessments, and system hardening.
   - **Example**: Azure Security Center can run vulnerability scans on VMs, providing a list of recommended security updates and helping the company quickly patch vulnerabilities to maintain secure compute environments.

6. **Application Security**

   - **Objective**: Protects applications from vulnerabilities and ensures they are securely coded and managed.
   - **Measures**: Secure application development practices, code analysis, runtime application self-protection (RASP), web application firewalls (WAF).
   - **Example**: A development team uses Azure Application Gateway’s Web Application Firewall to protect an e-commerce website against common attacks like SQL injection and cross-site scripting, blocking malicious requests at the application level.

7. **Data Security**
   - **Objective**: Ensures that data is securely stored, accessed, and managed.
   - **Measures**: Data encryption (at rest and in transit), data masking, access controls, and data loss prevention (DLP).
   - **Example**: A healthcare company stores patient data in Azure SQL Database, with encryption enabled for data at rest and in transit. Role-based access ensures only medical staff can view patient information, adding extra data security measures to comply with healthcare regulations.

---

### Benefits of Defense in Depth

1. **Comprehensive Security Coverage**: Protects every part of the cloud environment, from physical security at data centers to data encryption.
2. **Redundant Protections**: If one layer is breached, others remain active, minimizing overall risk.
3. **Tailored Security**: Allows organizations to apply relevant protections based on their unique needs and regulatory requirements.

---

### Example of Defense in Depth in Practice

Imagine a company storing confidential data on Azure. Here’s how Defense in Depth would work:

- **Physical Security**: Azure’s data center enforces biometric security, ensuring only specific personnel access server rooms.
- **Identity and Access**: Employees use multi-factor authentication and are assigned roles in Azure Active Directory, restricting access based on job responsibilities.
- **Perimeter Security**: Azure’s DDoS protection blocks unusual traffic patterns, preventing external DDoS attacks.
- **Network Security**: Network security groups limit access, only allowing essential communication between application and database servers.
- **Compute Security**: Azure Security Center regularly scans the company’s VMs, notifying IT of any necessary patches.
- **Application Security**: The application development team uses secure coding practices, preventing vulnerabilities like SQL injections.
- **Data Security**: Data at rest in Azure Storage is encrypted, and data in transit is protected with SSL/TLS, ensuring no unauthorized access.

Each layer adds redundancy, making it harder for potential attackers to breach the system, enhancing overall security.

### Confidentiality, Integrity, Availability (CIA)

As described above, a defense in-depth strategy uses a series of mechanisms to slow the advance of an attack. All the different mechanisms (technologies, processes, and training) are elements of a cybersecurity strategy, whose goals include ensuring confidentiality, integrity, and availability; often referred to as CIA.

![Diagram showing the Confidentiality, Integrity, Availability (CIA) triangle.](../../Assets/SC-900/4-confidentiality-integrity-availability.png)

**Confidentiality** refers to the need to keep confidential sensitive data such as customer information, passwords, or financial data. You can encrypt data to keep it confidential, but then you also need to keep the encryption keys confidential. Confidentiality is the most visible part of security; we can clearly see need for sensitive data, keys, passwords, and other secrets to be kept confidential.

**Integrity** refers to keeping data or messages correct. When you send an email message, you want to be sure that the message received is the same as the message you sent. When you store data in a database, you want to be sure that the data you retrieve is the same as the data you stored. Encrypting data keeps it confidential, but you must then be able to decrypt it so that it's the same as before it was encrypted. Integrity is about having confidence that data hasn't been tampered with or altered.

**Availability** refers to making data available to those who need it, when they need it. It's important to the organization to keep customer data secure, but at the same time it must also be available to employees who deal with customers. While it might be more secure to store the data in an encrypted format, employees need access to decrypted data.

While the goals of a cybersecurity strategy are to preserve the confidentiality, integrity, and availability of systems, networks, applications, and data; it's the goal of cybercriminals to disrupt these goals. Microsoft’s portfolio includes the solutions and technologies to enable organizations to deliver on the goals of the CIA triad.

### Learn More

For further details, visit the official Microsoft documentation on Defense in Depth: [Defense in Depth | Microsoft](https://learn.microsoft.com/en-us/training/modules/describe-security-concepts-methodologies/3-describe-defense-depth).

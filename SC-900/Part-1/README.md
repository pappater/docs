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

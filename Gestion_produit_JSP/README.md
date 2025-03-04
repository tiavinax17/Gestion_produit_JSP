
# Lancer un projet JSP développé sur Eclipse

Ce fichier README fournit les étapes nécessaires pour lancer un projet Java Server Pages (JSP) sur un nouveau PC en utilisant trois IDE populaires : Eclipse, IntelliJ IDEA et Visual Studio Code.

### Ce projet a été réalisé par :

- **RANDRIANJA Tiavina Eliot**
- **ChatGPT**

---

## Prérequis
- **Bootstrap 4** Modifier les liens Bootstrap si vous utilisez votre propre dossier Bootstrap
- **JDK (Java Development Kit)** version 8 ou supérieure
- **Serveur Tomcat** installé pour exécuter le projet JSP
- **IDE** (Eclipse, IntelliJ IDEA, ou Visual Studio Code)
- **Apache Maven** (optionnel pour la gestion des dépendances)
- **Git** (pour cloner le projet depuis un repository distant)

---

## 1. Sur Eclipse

### Étapes pour configurer et lancer un projet JSP sur Eclipse

1. **Installer Eclipse** :
   - Téléchargez et installez Eclipse IDE depuis le [site officiel d'Eclipse](https://www.eclipse.org/downloads/).
   - Lors de l'installation, choisissez l'option **Eclipse IDE for Java EE Developers** ou **Eclipse IDE for Java Developers**.

2. **Installer un serveur Tomcat** :
   - Téléchargez Apache Tomcat depuis le [site officiel d'Apache Tomcat](https://tomcat.apache.org/).
   - Décompressez le fichier téléchargé dans un répertoire de votre choix.

3. **Configurer Tomcat dans Eclipse** :
   - Ouvrez Eclipse.
   - Allez dans le menu `Window` > `Preferences` > `Server` > `Runtime Environments`.
   - Cliquez sur `Add Server` et sélectionnez `Apache Tomcat` dans la liste.
   - Indiquez le chemin du répertoire où Tomcat est installé.

4. **Cloner le projet depuis le repository Git** (si applicable) :
   - Ouvrez `Git Perspective` (Menu `Window` > `Perspective` > `Open Perspective` > `Git`).
   - Clonez votre projet depuis le repository distant en utilisant l'URL du repository.

5. **Importer le projet JSP dans Eclipse** :
   - Allez dans `File` > `Import` > `General` > `Existing Projects into Workspace`.
   - Sélectionnez le répertoire de votre projet.

6. **Configurer le projet JSP** :
   - Si votre projet utilise Maven, Eclipse peut détecter et importer automatiquement les dépendances. Si ce n'est pas le cas, vous pouvez configurer le projet manuellement.
   - Si nécessaire, ajustez les configurations du serveur Tomcat dans les propriétés du projet (clic droit sur le projet > `Properties` > `Targeted Runtimes`).

7. **Lancer le projet JSP** :
   - Faites un clic droit sur le projet dans l'explorateur de projet et sélectionnez `Run As` > `Run on Server`.
   - Le projet sera déployé sur Tomcat et vous pourrez y accéder via votre navigateur (généralement à `http://localhost:8080/`).

---

## 2. Sur IntelliJ IDEA

### Étapes pour configurer et lancer un projet JSP sur IntelliJ IDEA

1. **Installer IntelliJ IDEA** :
   - Téléchargez et installez IntelliJ IDEA depuis le [site officiel d'IntelliJ IDEA](https://www.jetbrains.com/idea/).
   
2. **Installer un serveur Tomcat** :
   - Comme pour Eclipse, téléchargez et installez Apache Tomcat sur votre machine.
   - Décompressez Tomcat dans un répertoire de votre choix.

3. **Configurer Tomcat dans IntelliJ IDEA** :
   - Allez dans `File` > `Settings` (ou `Ctrl + Alt + S`).
   - Dans la section `Build, Execution, Deployment`, sélectionnez `Application Servers`.
   - Cliquez sur `+` et sélectionnez `Tomcat Server`.
   - Indiquez le chemin du répertoire où Tomcat est installé.

4. **Cloner le projet depuis Git** :
   - Si vous utilisez Git, allez dans `File` > `New` > `Project from Version Control`, puis entrez l'URL de votre repository Git.

5. **Importer le projet JSP dans IntelliJ IDEA** :
   - Une fois le projet cloné, ouvrez-le dans IntelliJ IDEA.

6. **Configurer le projet JSP** :
   - Si vous utilisez Maven, IntelliJ IDEA devrait automatiquement télécharger les dépendances du projet.
   - Allez dans `File` > `Project Structure`, puis dans `Modules`, assurez-vous que le projet est bien configuré comme un projet web (Web Application).

7. **Lancer le projet JSP** :
   - Allez dans `Run` > `Edit Configurations`.
   - Ajoutez une nouvelle configuration de serveur Tomcat en sélectionnant votre installation de Tomcat.
   - Sélectionnez le module web du projet et cliquez sur `Apply` puis `OK`.
   - Cliquez sur `Run` pour démarrer le serveur et accéder à votre projet via le navigateur.

---

## 3. Sur Visual Studio Code (VS Code)

### Étapes pour configurer et lancer un projet JSP sur VS Code

1. **Installer Visual Studio Code** :
   - Téléchargez et installez Visual Studio Code depuis le [site officiel de VS Code](https://code.visualstudio.com/).

2. **Installer le JDK** :
   - Si vous n'avez pas encore installé le JDK, vous pouvez télécharger Java depuis le [site officiel de Oracle JDK](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).

3. **Installer Apache Tomcat** :
   - Téléchargez et installez Apache Tomcat, comme mentionné dans les étapes précédentes.

4. **Installer les extensions nécessaires** :
   - Dans VS Code, installez les extensions suivantes :
     - **Java Extension Pack** (pour le support Java et JSP).
     - **Debugger for Java** (pour le débogage Java).
     - **Tomcat for Java** (pour déployer sur Tomcat).

5. **Cloner le projet depuis Git** :
   - Ouvrez un terminal dans VS Code et utilisez la commande `git clone` pour récupérer le projet.

6. **Configurer le projet JSP** :
   - Ouvrez le dossier du projet dans VS Code.
   - Si le projet utilise Maven, assurez-vous que le fichier `pom.xml` est présent et que toutes les dépendances sont installées via le terminal (par exemple, `mvn clean install`).

7. **Configurer Tomcat dans VS Code** :
   - Allez dans le menu `View` > `Tomcat` > `Servers`.
   - Cliquez sur `+` pour ajouter votre installation de Tomcat et configurez-le.

8. **Lancer le projet JSP** :
   - Clic droit sur le projet et sélectionnez `Deploy to Tomcat` via l'extension **Tomcat for Java**.
   - Vous pouvez accéder à votre projet via le navigateur à l'adresse `http://localhost:8080/`.

---

## Conclusion

Ce fichier README couvre les étapes nécessaires pour lancer un projet JSP sur trois IDE différents. Assurez-vous que votre environnement de développement (JDK, Tomcat, etc.) est bien configuré avant de commencer. Une fois toutes les étapes suivies, vous serez prêt à lancer votre projet JSP sur le serveur Tomcat depuis Eclipse, IntelliJ IDEA ou Visual Studio Code.

---


# Run a JSP Project Developed on Eclipse

This README file provides the necessary steps to launch a Java Server Pages (JSP) project on a new PC using three popular IDEs: Eclipse, IntelliJ IDEA, and Visual Studio Code.

### This project was developed by:

- **RANDRIANJA Tiavina Eliot**
- **ChatGPT**

---

## Prerequisites
- **Bootstrap 4** Modify the Bootstrap links if you are using your own Bootstrap folder
- **JDK (Java Development Kit)** version 8 or higher
- **Tomcat Server** installed to run the JSP project
- **IDE** (Eclipse, IntelliJ IDEA, or Visual Studio Code)
- **Apache Maven** (optional for dependency management)
- **Git** (to clone the project from a remote repository)

---

## 1. On Eclipse

### Steps to set up and run a JSP project on Eclipse

1. **Install Eclipse**:
   - Download and install Eclipse IDE from the [official Eclipse website](https://www.eclipse.org/downloads/).
   - During installation, choose the **Eclipse IDE for Java EE Developers** or **Eclipse IDE for Java Developers** option.

2. **Install Tomcat Server**:
   - Download Apache Tomcat from the [official Apache Tomcat website](https://tomcat.apache.org/).
   - Unzip the downloaded file into a directory of your choice.

3. **Configure Tomcat in Eclipse**:
   - Open Eclipse.
   - Go to the menu `Window` > `Preferences` > `Server` > `Runtime Environments`.
   - Click on `Add Server` and select `Apache Tomcat` from the list.
   - Specify the path of the directory where Tomcat is installed.

4. **Clone the project from the Git repository** (if applicable):
   - Open the `Git Perspective` (Menu `Window` > `Perspective` > `Open Perspective` > `Git`).
   - Clone your project from the remote repository using the repository URL.

5. **Import the JSP project into Eclipse**:
   - Go to `File` > `Import` > `General` > `Existing Projects into Workspace`.
   - Select the directory of your project.

6. **Configure the JSP project**:
   - If your project uses Maven, Eclipse can automatically detect and import the dependencies. If not, you can manually configure the project.
   - If necessary, adjust the Tomcat server configurations in the project properties (right-click on the project > `Properties` > `Targeted Runtimes`).

7. **Run the JSP project**:
   - Right-click on the project in the project explorer and select `Run As` > `Run on Server`.
   - The project will be deployed to Tomcat and you can access it via your browser (usually at `http://localhost:8080/`).

---

## 2. On IntelliJ IDEA

### Steps to set up and run a JSP project on IntelliJ IDEA

1. **Install IntelliJ IDEA**:
   - Download and install IntelliJ IDEA from the [official IntelliJ IDEA website](https://www.jetbrains.com/idea/).

2. **Install Tomcat Server**:
   - As with Eclipse, download and install Apache Tomcat on your machine.
   - Unzip Tomcat into a directory of your choice.

3. **Configure Tomcat in IntelliJ IDEA**:
   - Go to `File` > `Settings` (or `Ctrl + Alt + S`).
   - In the `Build, Execution, Deployment` section, select `Application Servers`.
   - Click `+` and select `Tomcat Server`.
   - Specify the path of the directory where Tomcat is installed.

4. **Clone the project from Git**:
   - If you're using Git, go to `File` > `New` > `Project from Version Control`, then enter the URL of your Git repository.

5. **Import the JSP project into IntelliJ IDEA**:
   - Once the project is cloned, open it in IntelliJ IDEA.

6. **Configure the JSP project**:
   - If you're using Maven, IntelliJ IDEA should automatically download the project dependencies.
   - Go to `File` > `Project Structure`, then in `Modules`, make sure the project is set up as a web project (Web Application).

7. **Run the JSP project**:
   - Go to `Run` > `Edit Configurations`.
   - Add a new Tomcat server configuration by selecting your Tomcat installation.
   - Select the web module of the project and click `Apply` then `OK`.
   - Click `Run` to start the server and access your project via the browser.

---

## 3. On Visual Studio Code (VS Code)

### Steps to set up and run a JSP project on VS Code

1. **Install Visual Studio Code**:
   - Download and install Visual Studio Code from the [official VS Code website](https://code.visualstudio.com/).

2. **Install the JDK**:
   - If you haven't installed the JDK yet, you can download Java from the [official Oracle JDK website](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).

3. **Install Apache Tomcat**:
   - Download and install Apache Tomcat as mentioned in the previous steps.

4. **Install necessary extensions**:
   - In VS Code, install the following extensions:
     - **Java Extension Pack** (for Java and JSP support).
     - **Debugger for Java** (for Java debugging).
     - **Tomcat for Java** (for deploying to Tomcat).

5. **Clone the project from Git**:
   - Open a terminal in VS Code and use the `git clone` command to retrieve the project.

6. **Configure the JSP project**:
   - Open the project folder in VS Code.
   - If the project uses Maven, ensure the `pom.xml` file is present and that all dependencies are installed via the terminal (e.g., `mvn clean install`).

7. **Configure Tomcat in VS Code**:
   - Go to the menu `View` > `Tomcat` > `Servers`.
   - Click `+` to add your Tomcat installation and configure it.

8. **Run the JSP project**:
   - Right-click on the project and select `Deploy to Tomcat` via the **Tomcat for Java** extension.
   - You can access your project via the browser at `http://localhost:8080/`.

---

## Conclusion

This README file covers the necessary steps to launch a JSP project on three different IDEs. Make sure your development environment (JDK, Tomcat, etc.) is properly set up before starting. Once all the steps are followed, you'll be ready to run your JSP project on the Tomcat server from Eclipse, IntelliJ IDEA, or Visual Studio Code.

---

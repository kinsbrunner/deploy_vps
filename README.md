# deploy_vps
Deploying digital ocean vps with terraform.


If you’re on macOS or Linux, you can download Terraform with curl.

On macOS, use this command to download Terraform and place it in your home directory:
curl -o ~/terraform.zip https://releases.hashicorp.com/terraform/0.13.1/terraform_0.13.1_darwin_amd64.zip 

On Linux, use this command:
curl -o ~/terraform.zip https://releases.hashicorp.com/terraform/0.13.1/terraform_0.13.1_linux_amd64.zip 

Then extract Terraform and place it in the ~/opt/terraform directory. First, create the ~/opt/terraform directory:
mkdir -p ~/opt/terraform
unzip ~/terraform.zip -d ~/opt/terraform

Finally, add ~/opt/terraform/, to your PATH environment variable so you can execute the terraform command without specifying the full path to the executable.

On Linux, add the path to the file .bashrc:
nano ~/.bashrc

To append Terraform’s path to your PATH, add the following line at the end of the file:
export PATH=$PATH:~/opt/terraform

Save the file and exit the editor.

Now all of your new shell sessions will be able to find the terraform command. To load the new PATH into your current session, type the following command if you’re using Bash on a Linux system:
. .bashrc

If you’re using Bash on macOS, execute this command instead:
. .bash_profile

If you’re using ZSH, run this command:
. .zshrc

To verify that you have installed Terraform correctly, run the terraform command with no arguments:
terraform

You will see output that is similar to the following:
Output
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.

Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    login              Obtain and save credentials for a remote host
    logout             Remove locally-stored credentials for a remote host
    output             Read an output from a state file
    plan               Generate and show an execution plan
    ...
    
These are the commands that Terraform accepts. The output gives you a brief description, but you will get into how to use them throughout this tutorial.

Now that Terraform is installed.

_________________________________________________________________________________________________________________________________________________________

Now, you must create your public and private key ssh to use when you need to connect safely to the server with ssh. save your keys in the directory "~/.ssh/terraform/id_rsa"

finally you need to create your dropplet creation plan with the command
>>> terraform plan -out=droplet.tfplan

and then, execute this file to create the dropplet with the command 
>>> terraform apply "droplet.tfplan" 

In a couple of minutes, your dropplet will be created with all the tools that you need.

Note: the dropplet get all the tools from terraform provisioning, you need to create a bash script that download all the tools and store this script in your github repository, then with the provisioning you need to call this repository to download the bash script to auto install the tools. You need to edit the script and modify the dropplet.tf file line 25 with your script to download all the tools

In order to delete the droplet, 
>>> terraform plan -destroy -out=droplet.tfplan
>>> terraform apply "droplet.tfplan"

_________________________________________________________________________________________________________________________________________________________

If using TMUX, the relevant commands are:
-> Ctrl + b + z: minimize current session
-> tmux ls: see the list of available sessions
-> tmux attach -t <session>: to re-open the specified session

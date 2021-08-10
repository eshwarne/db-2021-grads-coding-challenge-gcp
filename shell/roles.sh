# Script to Enable APIs in Batch Project, Create App Engine and to assign App Engine SA SQL Role in DB Project


# Add Project Ids of all 29 Projects
declare -a projects=("grads-coding-challenge-group-1")

for i in "${projects[@]}"
do
  # Setting Batch Project
  gcloud config set project $i
  # Enabling All APIs
  gcloud services enable cloudresourcemanager.googleapis.com serviceusage.googleapis.com logging.googleapis.com appengine.googleapis.com cloudbuild.googleapis.com
  # CReating App Engine
  gcloud app create --region=us-central || echo "Already Created"
  
  # Assigning roles to Cloud Build Service Account
  number=$(gcloud projects list --filter="$i" --format="value(PROJECT_NUMBER)")
  sa="${number}@cloudbuild.gserviceaccount.com"
  gcloud projects add-iam-policy-binding $i --member="serviceAccount:${sa}" --role='roles/appengine.deployer'
  gcloud projects add-iam-policy-binding $i --member="serviceAccount:${sa}" --role='roles/appengine.serviceAdmin'
  gcloud projects add-iam-policy-binding $i --member="serviceAccount:${sa}" --role='roles/iam.serviceAccountUser'
  gcloud projects add-iam-policy-binding $i --member="serviceAccount:${sa}" --role='roles/storage.objectCreator'
  
done

# Setting Database Project
gcloud config set project grad-coding-challenge-1

for i in "${projects[@]}"
do
    # Assigning Roles to Batch Project App Engine SA
    sa="${i}@appspot.gserviceaccount.com"
    gcloud projects add-iam-policy-binding grad-coding-challenge-1 --member="serviceAccount:${sa}" --role='roles/cloudsql.client'
done

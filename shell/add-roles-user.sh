while read -r line
do
    email=$(echo "$line" |awk -F "\"*,\"*" '{print $4}')
    project=$(echo "$line" | awk -F "\"*,\"*" '{print $6}')
    echo "Email: $email"
    #    gcloud projects add-iam-policy-binding $project --member="user:${email}" --role='roles/appengine.deployer'
    #    gcloud projects add-iam-policy-binding $project --member="user:${email}" --role='roles/appengine.serviceAdmin'
    #    gcloud projects add-iam-policy-binding $project --member="user:${email}" --role='roles/cloudbuild.builds.editor'
    #    gcloud projects add-iam-policy-binding $project --member="user:${email}" --role='roles/storage.objectCreator'
    #    gcloud projects add-iam-policy-binding $project --member="user:${email}" --role='roles/iam.serviceAccountUser'
    #    gcloud projects add-iam-policy-binding $project --member="user:${email}" --role='roles/source.writer'
    #    gcloud projects add-iam-policy-binding $project --member="user:${email}" --role='roles/viewer'

    echo "Roles Applied for - $project"
done < batch.csv

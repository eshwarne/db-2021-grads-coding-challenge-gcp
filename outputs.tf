output "databases-names" { 
     value = google_sql_database.database.*.name
}
output "database-users" { 
     value = google_sql_user.users.*.name
    description = "user name for grads for each database"
}
output "database-password" { 
     value = google_sql_user.users.*.password
     description = "Password for grads to use the database as users."
     sensitive = true
}
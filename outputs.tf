output "databases-names" { 
     value = google_sql_database.database.*.name
}
output "database-users" { 
     value = google_sql_user.users.*.name
}
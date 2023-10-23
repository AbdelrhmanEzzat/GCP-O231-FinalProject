output "vpc_name" {
    value = google_compute_network.abdo_vpc.id
}

output "management_subnet" {

    value = google_compute_subnetwork.management_subnet.id
}
output "management_subnet_cidr" {

    value = google_compute_subnetwork.management_subnet.ip_cidr_range
}

output "workload_subnet" {
    value = google_compute_subnetwork.workload_subnet.id

}


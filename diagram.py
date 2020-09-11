from diagrams import Diagram, Cluster, Edge
from diagrams.aws.network import ELB, Route53
from diagrams.aws.security import CertificateManager
from diagrams.aws.storage import S3
from diagrams.generic.blank import Blank

with Diagram("AWS Load Balancer", show=False, direction="TB"):

    logging = S3("logging bucket")

    endpoint = Route53("endpoint")

    tls = CertificateManager("tls certificate")

    with Cluster("vpc"):

        lb = ELB("load balancer")
        lb << Edge(label="tls certificate")

        listener = ELB("listener (*)")
        listener << tls

        lb - listener - ELB("target group (*)")

        endpoint >> lb >> Edge(label="access logs") >> logging

    Blank("* 0..n")
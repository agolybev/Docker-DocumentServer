variable "TAG" {
    default = ""
}

variable "SHORTER_TAG" {
    default = ""
}

variable "SHORTEST_TAG" {
    default = ""
}

variable "COMPANY_NAME" {
    default = ""
}

variable "PREFIX_NAME" {
    default = ""
}

variable "PRODUCT_EDITION" {
    default = ""
}

variable "PRODUCT_NAME" {
    default = ""
}

variable "DOCKERFILE" {
    default = ""
}

target "documentserver" {
    target = "documentserver"
    dockerfile= "${DOCKERFILE}"
    tags = ["docker.io/${COMPANY_NAME}/${PREFIX_NAME}${PRODUCT_NAME}${PRODUCT_EDITION}:${TAG}"]
    platforms = ["linux/amd64", "linux/arm64"]
    args = {
        "PRODUCT_EDITION": "${PRODUCT_EDITION}"
        "PRODUCT_NAME": "${PRODUCT_NAME}"
        "COMPANY_NAME": "${COMPANY_NAME}"
    }
}

target "documentserver-stable" {
    target = "documentserver-stable"
    dockerfile= "${DOCKERFILE}"
    tags = ["docker.io/${COMPANY_NAME}/${PREFIX_NAME}${PRODUCT_NAME}${PRODUCT_EDITION}:${TAG}",
            "docker.io/${COMPANY_NAME}/${PREFIX_NAME}${PRODUCT_NAME}${PRODUCT_EDITION}:${SHORTER_TAG}",
            "docker.io/${COMPANY_NAME}/${PREFIX_NAME}${PRODUCT_NAME}${PRODUCT_EDITION}:${SHORTEST_TAG}",
            "docker.io/${COMPANY_NAME}/${PREFIX_NAME}${PRODUCT_NAME}${PRODUCT_EDITION}:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
    args = {
        "PRODUCT_EDITION": "${PRODUCT_EDITION}"
        "PRODUCT_NAME": "${PRODUCT_NAME}"
        "COMPANY_NAME": "${COMPANY_NAME}"
    }
}
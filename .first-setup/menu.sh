LEVEL1=['Generic', 'Terraform']
CLOUDS=['Azure']

select choice in $LEVEL1
do
    case $choice in
    Terraform)
        mv terraform.mk.init terraform.mk
        select cloud in $CLOUDS
        do
            case $cloud in
                Azure)
                    mv terraform-azure.mk.init terraform-azure.mk
            esac

        done
    esac

done


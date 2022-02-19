#!/bash/bin
touch contacts.csv

order="a"
while getopts "f:l:n:o:k:adc:v:C:" flag
    do
    case "${flag}" in 
        f)
            fname=${OPTARG}
            ;;
        l)
            lname=${OPTARG}
            ;;
        n)
            number=${OPTARG}
            ;;
        o)
            company=${OPTARG}
            ;;
        k)
            old_fname=${OPTARG}
            ;;
        a)
            order="a"
            ;;
        d)
            order="d"
            ;;
        c)
            column_name=${OPTARG}
            ;;
        v)
            column_value=${OPTARG}
            ;;
        C)
            operation=${OPTARG}
           ;;
    esac
    done

case "${operation}" in
    insert)
        echo "$fname,$lname,$number,$company" >> contacts.csv
        ;;
    edit)
        sed -E -i "s/$old_fname,[A-Za-z0-9+,_.-]+/$fname,$lname,$number,$company/g" contacts.csv
        ;;
    display)
        case $order in
            a)
                sort -f  -k1 contacts.csv
                ;;
            d)
                sort -r -f  -k1 contacts.csv
                ;;

        esac
        ;;
    search)
        case $column_name in 
            fname)
                grep -P "\b$column_value,[A-Za-z0-9+,\s_.-]+\b" contacts.csv
                ;;
            lname)
                grep -P "\b[A-Za-z\s_.-]*,$column_value,[A-Za-z0-9+,\s_.-]+\b" contacts.csv
                ;;
            mobile)
                grep -P "\b[A-Za-z\s_.-]*,[A-Za-z\s_.-]*,$column_value,[A-Za-z\s_.-]*\b" contacts.csv
                ;;
            Office)
                grep -P "\b[A-Za-z\s_.-]*,[A-Za-z\s_.-]*,[0-9+\s-]*,$column_value\b" contacts.csv
                ;;

        esac
        ;;
    delete)
        case $column_name in 
            fname)
                sed -E -i "/\b$column_value,[A-Za-z0-9+,\s_.]+\b/d" contacts.csv
                ;;
            lname)
                sed -E -i "/\b[A-Za-z\s_.]*,$column_value,[A-Za-z0-9+,\s_.]+\b/d" contacts.csv
                ;;
            mobile)
                sed -E -i "/\b[A-Za-z\s_.]*,[A-Za-z\s_.]*,$column_value,[A-Za-z\s_.]*\b/d" contacts.csv
                ;;
            Office)
               sed -E -i "/\b[A-Za-z\s_.]*,[A-Za-z\s_.]*,[0-9+\s]*,$column_value\b/d" contacts.csv
                ;; 

        esac       
        ;;
esac
#!/bin/bash
tput civis
    cd
Frame() {
    clear
    tput cup 0 0
    echo "=============================================== 2015726056 Donghee Cho ================================================="
    echo "======================================================== List =========================================================="
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"
    echo "|                         |                                            |                                               |"

    echo "====================================================== Infomation ======================================================"
    echo "|                                                                                                                      |"
    echo "|                                                                                                                      |"
    echo "|                                                                                                                      |"
    echo "|                                                                                                                      |"
    echo "|                                                                                                                      |"
    echo "|                                                                                                                      |"
    echo "======================================================== Total ========================================================="
    echo "|                                                                                                                      |"
    echo "========================================================= End ========== press q to quit ==============================="
}

List() {
    if [ "`pwd`" = "/home" ]
    then
        cd
    fi

   line=4
   num=0
   None=1
   all=()
   tput cup 2 1
   echo [34m..
   tput cup 3 1
   if [ -s "2015726056-TrashBin" ]
   then
       echo [33m"2015726056-TrashBin"
   else
       mkdir 2015726056-TrashBin
       echo [33m"2015726056-TrashBin"
   fi


   for var in *
   do
        tput cup $line 1
        if [ -f "$var" ]
        then
            if [ -x "$var" ]
            then
                echo [32m"$var" | cut -c 1-28
            elif [ -n "`echo "$var" | grep ".zip$"`" ] || [ -n "`echo "$var" | grep ".gz$"`" ] || [ -n "`echo "$var" | grep ".tar$"`" ]
            then
                echo [31m"$var" | cut -c 1-28
            else
                echo  [0m"$var" | cut -c 1-27
            fi
        elif [ -d "$var" ] && [ "$var" != "2015726056-TrashBin" ]
        then
            echo [34m"$var" | cut -c 1-28
        fi

        if [ "$var" != "2015726056-TrashBin" ]
        then
            line=`expr $line + 1`
            all[$num]="$var"
            num=`expr $num + 1`
        fi
        if [ $num -ge 26 ]
        then
            break;
        fi
    done

    if [ ${#all[*]} = 0 ]
    then
        None=0
    fi

    Total
}


Cursor() {
    key=0
    Cur_Line=2
    while [ 1 ]
    do

        List
        End_Line=`expr ${#all[*]} + 3`

        if [ $Cur_Line -le 2 ]
        then
            Cur_Line=2
            tput cup $Cur_Line 1
            tput sgr 0
            echo `tput setab 4`".."
            tput sgr 0
            Info ".."
        elif [ $Cur_Line = 3 ]
        then
            tput cup $Cur_Line 1
            tput sgr 0
            echo `tput setab 3`"2015726056-TrashBin"
            tput sgr 0
            Info "2015726056-TrashBin"
        elif [ $Cur_Line -gt 3 ]
        then
            if [ $Cur_Line -ge $End_Line ]
            then
                Cur_Line=$End_Line
            fi
            N=`expr $Cur_Line - 4`
            tput cup $Cur_Line 1
            if  [ -d "${all[$N]}" ]
            then
                tput sgr 0
                echo `tput setab 4`"${all[$N]}" | cut -c 1-28
                tput sgr 0
            elif [ -x "${all[$N]}" ]
            then
                tput sgr 0
                echo `tput setab 2`"${all[$N]}" | cut -c 1-28
                tput sgr 0

            elif [ -f "${all[$N]}" ]
            then

                if [ "`echo "${all[$N]}" | grep ".zip$"`" ] || [ "`echo "${all[$N]}" | grep ".gz$"`" ] || [ "`echo "${all[$N]}" | grep ".tar$"`" ]
                then
                    tput sgr0
                   echo `tput setab 1`"${all[$N]}" | cut -c 1-28
               else
                   tput sgr0
                   echo `tput setab 6`"${all[$N]}" | cut -c 1-28
               fi
                   tput sgr 0
            fi

            Info "${all[$N]}"



        fi

        read -sn 1 key
        if [ "$key" = '' ]
        then
            read -sn 1 key
            read -sn 1 key
            if [ "$key" = "A" ]
            then
                Cur_Line=`expr $Cur_Line - 1`
                Frame
            elif [ "$key" = "B" ]
            then
                Cur_Line=`expr $Cur_Line + 1`
                if [ $Cur_Line -gt 3 ] && [ $None = 0 ]
                then
                    Cur_Line=3
                fi
                Frame
            fi

        elif [ "$key" = "" ]
        then
            if [ $Cur_Line = 2 ]
            then
                cd ..
                Cur_Line=2
                clear
                Frame


            elif [ $Cur_Line = 3 ]
            then
                cd "`pwd`/2015726056-TrashBin"
                Cur_Line=2
                clear
                Frame

            else
                if [ -d "${all[$N]}" ]
                then
                    cd "`pwd`/${all[$N]}"
                    Cur_Line=2
                    clear
                    Frame

                elif [ -f "${all[$N]}" ]
                then
                    if [ -z "`echo "${all[$N]}" | grep ".zip$"`" ] && [ -z "`echo "${all[$N]}" | grep ".gz$"`" ] && [ -z "`echo "${all[$N]}" | grep ".tar$"`" ] && [ ! -x "`echo "${all[$N]}" | grep ".out$"`" ]

                        then

                        if [ -n "`file "${all[$N]}" | grep "ASCII text"`" ] || [ -n "`file "${all[$N]}" | grep "Unicode text"`" ]
                        then
                            m=2
                            n=1
                            while [ 1 ]
                            do
                                a=`head -30 "${all[$N]}" | tail -30`
                                b=`head -$n "${all[$N]}" | tail -30`
                                Content="$n `head -$n "${all[$N]}" | cut -c 1-41 | tail -1`"
                                tput cup $m 27
                                echo "$Content"
                                m=`expr $m + 1`
                                n=`expr $n + 1`
                                if [ "$m" = "30" ] || [ "$n" = "30" ]
                                then
                                    break
                                fi
                                if [ "$a" = "$b" ]
                                then
                                    break
                                fi
                            done
                        fi
                    fi
                fi
            fi


        elif [ "$key" = "d" ]
        then
            if [ "$Cur_Line" = 3 ]
            then
                All_Del "2015726056-TrashBin"
                clear
                Frame
            elif [ "$Cur_Line" -gt 3 ]
            then
                Del "${all[$N]}" "`pwd`"
                clear
                Frame
            fi

        elif [ "$key" = "t" ]
        then
            arr=()
            arr1=()
            arr2=()
            None_tree=0
            tree_i=0
            if [ "$Cur_Line" -le 3 ]
            then
                tput cup 2 72
                echo "  "[34m..[0m" , "[33m2015726056-TrashBin[0m" 의 트리 구조는"
                tput cup 3 72
                echo "          직접적으로 볼 수 없습니다."
            elif [ -d "${all[$N]}" ]
            then
                name="${all[$N]}"
                cd "${all[$N]}"
                tree1
                if [ $None_tree -ge 1 ]
                then
                    Tree_Cursor "$name"
                else
                   # tput cup 2 72
                   # echo -n "$name" | cut -c -43
                    tput cup 3 77
                    echo "[0m이 디렉토리는 비어 있습니다. "
                fi
                cd ..
            fi
       elif [ "$key" = "q" ]
       then
           exit 0
       fi


    done
}

Del() {

   tar -cf "2015726056.tar" "$1"
   cd "2015726056-TrashBin"
   tar -xf "$2"/"2015726056.tar"
   cd ..
   rm -rf "$1"
   rm -rf "2015726056.tar"

}



All_Del() {
    cd "$1"
    for trash in *
    do
        rm -rf "$trash"
    done
    cd ..
}

Rec() {
for rec in *
do
    if [ "$rec" != "*" ]
    then
            rec_num=`expr $rec_num + 1`
            rec_o=`expr $L - 3 + $rec_num`
        if [ -d "$rec" ]
        then
            if [ "`echo ${arr[$rec_o]} | cut -c -1`" = "-" ]
            then
                cd "$rec"
                Rec
                cd ..
            fi

        fi
    fi
done
}
tree() {
    br=0 # p
    m=0
    z1=0
    a1=1
    rec_num=0
    rec_o=0
    if [ $1 = 1 ]
    then
      Rec
      br=$rec_num
       if [ $br ]
       then
        while [ $m -lt `expr $2 - $tree_i - $br` ]
        do
            arr[`expr $tree_i + $m`]=${arr[`expr $tree_i + $br + $m`]}
            arr1[`expr $tree_i + $m`]=${arr[`expr $tree_i + $br + $m`]}
            arr2[`expr $tree_i + $m`]=${arr[`expr $tree_i + $br + $m`]}


            m=`expr $m + 1`
        done
    fi
    elif [ $1 = 2 ]
    then
        for Tree in *
        do
            if [ "$Tree" != "*" ]
            then
                br=`expr $br + 1`
            fi
        done

        if [ $br ]
        then
            while [ $m -lt `expr $2 - $tree_i` ]
            do
                arr[`expr $2 - 1 + $br - $m`]=${arr[`expr $2 - 1 - $m`]}
                arr1[`expr $2 - 1 + $br - $m`]=${arr[`expr $2 - 1 - $m`]}
                arr2[`expr $2 - 1 + $br - $m`]=${arr[`expr $2 - 1 - $m`]}
                m=`expr $m + 1`
            done

            for Tree in *
            do
                if [ "$Tree" != "*" ]
                then
                    if [ -d "$Tree" ]
                    then
                        arr[$tree_i]="+ $Tree"
                        arr1[$tree_i]=`expr $3 + 1`
                        arr2[$tree_i]=0
                        tput cup `expr $tree_i + 3` 72
                        tput sgr 0
                        if [ "$tree_i" -lt 27 ]
                        then

                        while [ $z1 -le $3 ]
                        do
                            echo -n "...."
                            z1=`expr $z1 + 1`
                        done


                        echo [34m" ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                        z1=0
                        tree_i=`expr $tree_i + 1`
                    fi
                elif [ -f "$Tree" ]
                then
                    arr[$tree_i]="$Tree"
                    arr1[$tree_i]=`expr $3 + 1`

                    tput cup `expr $tree_i + 3` 72
                    tput sgr 0
                    if [ "$tree_i" -lt 27 ]
                    then

                        while [ $z1 -le $3 ]
                        do
                            echo -n "...."
                            z1=`expr $z1 + 1`
                        done

                        if [ "`echo "$Tree" | grep ".zip$"`" ] || [ "`echo "$Tree" | grep ".gz$"`" ] || [ "`echo "$Tree" | grep ".tar$"`" ]
                        then
                            echo [31m" ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                            arr2[$tree_i]=1
                        elif [ -x "$Tree" ]
                        then
                            echo [32m" ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                            arr2[$tree_i]=2
                        else
                            echo " ${arr[$tree_i]}" | cut -c -`expr 47 - $z1 \* 4`
                            arr2[$tree_i]=3
                        fi
                    fi
                    z1=0
                    tree_i=`expr $tree_i + 1`
                fi
            fi
        done
    fi

    elif [ $1 = 3 ]
    then
        for Tree in *
        do
            if [ "$Tree" != "*" ]
            then
                br=`expr $br + 1`
            fi
        done

        for Tree in *
        do
            if [ "$Tree" != "*" ]
            then

                tput cup `expr $tree_i + 3` 72
                tput sgr 0
                if [ "$tree_i" -lt 27 ]
                then
                    while [ $z1 -le $3 ]
                    do
                        echo -n "...."
                        z1=`expr $z1 + 1`
                    done



                fi


            fi
            if [ -d "$Tree" ]
            then
                if [ "$tree_i" = `expr $L - 3` ] && [ "${arr[$tree_i]}" = "+ $Tree" ]
                then
                    arr[$tree_i]="- $Tree"
                   arr1[$tree_i]=`expr $3 + 1` #######################
                   arr2[$tree_i]=0

                    if [ "$tree_i" -lt 27 ]
                    then
                        echo [34m" ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                    fi
                    z1=0
                    tree_i=`expr $tree_i + 1`
                    cd "$Tree"
                z=`expr $3 + 1`

                #arr1[$tree_i]=$z
                    tree "2" "${#arr[*]}" "$z"
                    cd ..
                elif [ "$tree_i" != `expr $L - 3` ] && [ "${arr[$tree_i]}" = "- $Tree" ]
                then
                    arr[$tree_i]="- $Tree"
                    arr1[$tree_i]=`expr $3 + 1` ######################
                   arr2[$tree_i]=0
                    if [ "$tree_i" -lt 27 ]
                    then
                        echo [34m" ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                    fi

                    z1=0
                    tree_i=`expr $tree_i + 1`
                    cd "$Tree"
                    z=`expr $3 + 1`
                  #  arr1[$tree_i]=$z
                    tree "3" "${#arr[*]}" "$z"
                    cd ..

                elif [ "$tree_i" = `expr $L - 3` ] && [ "${arr[$tree_i]}" = "- $Tree" ]
                then
                    arr[$tree_i]="+ $Tree"
                    arr1[$tree_i]=`expr $3 + 1`
                    arr2[$tree_i]=0
                    if [ "$tree_i" -lt 27 ]
                    then
                        echo [34m" ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                    fi
                    z1=0
                    tree_i=`expr $tree_i + 1`
                    cd $Tree
                    tree "1" "${#arr[*]}"
                    cd ..

                else
                    arr[$tree_i]="+ $Tree"
                    arr1[$tree_i]=`expr $3 + 1` ####################3
                   arr2[$tree_i]=0

                    if [ "$tree_i" -lt 27 ]
                    then
                        echo [34m" ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                    fi
                    z1=0
                    tree_i=`expr $tree_i + 1`
                fi

        elif [ -f "$Tree" ]
        then
            arr[$tree_i]="$Tree"
            arr1[$tree_i]=`expr $3 + 1`
                 if [ "$tree_i" -lt 27 ]
                 then
                     if [ "`echo "$Tree" | grep ".zip$"`" ] || [ "`echo "$Tree" | grep ".gz$"`" ] || [ "`echo "$Tree" | grep ".tar$"`" ]
                     then
                         echo "[31m ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                         arr2[$tree_i]=1

                     elif [ -x "$Tree" ]
                     then
                         echo "[32m ${arr[$tree_i]}"[0m | cut -c -`expr 47 - $z1 \* 4`
                         arr2[$tree_i]=2
                     else
                         echo " ${arr[$tree_i]}" | cut -c -`expr 47 - $z1 \* 4`
                         arr2[$tree_i]=3


                     fi
                 fi
            z1=0
            tree_i=`expr $tree_i + 1`

        fi
        done



    fi




}
tree1() {

    Frame
    cd ..
    List
    Info "${all[$N]}"
    cd "${all[$N]}"

    z=1
    tput cup 2 72
    echo [34m"- ${all[$N]}"[0m | cut -c -47

    for Tree in *
    do
        if [ "$Tree" != "*" ]
        then
            None_tree=`expr $None_tree + 1`
        fi
    done
    if [ $None_tree -ge 1 ]
    then
    for Tree in *
    do

        if [ -d "$Tree" ]
        then
            if [ "$2" = "$tree_i" ]
            then
                if [ "${arr[$tree_i]}" = "- $Tree" ]
                then
                    arr[$tree_i]="+ $Tree"
                    arr1[$tree_i]=$z
                    arr2[$tree_i]=0
                    tput cup `expr $tree_i + 3` 72
                    tput sgr 0
                    if [ "$tree_i" -lt 27 ]
                    then
                        echo ".... [34m${arr[$tree_i]}"[0m | cut -c -47
                    fi
                    tree_i=`expr $tree_i + 1`
                    cd "$Tree"
                    tree "1" "${#arr[*]}"
                    cd ..


                elif [ "$2" = "$tree_i" ] && [ "${arr[$tree_i]}" = "+ $Tree" ]
                then
                    arr[$tree_i]="- $Tree"
                    arr1[$tree_i]=$z
                    arr2[$tree_i]=0
                    tput cup `expr $tree_i + 3` 72
                    tput sgr 0
                    if [ "$tree_i" -lt 27 ]
                    then
                        echo ".... [34m${arr[$tree_i]}"[0m | cut -c -47
                    fi
                    tree_i=`expr $tree_i + 1`
                    cd "$Tree"
                    tree "2" "${#arr[*]}" "$z"
                    cd ..
                    z=1
                fi

            elif [ "${arr[$tree_i]}" = "- $Tree" ]
            then
                arr[$tree_i]="- $Tree"
                arr1[$tree_i]=$z
                arr2[$tree_i]=0
                tput cup `expr $tree_i + 3` 72
                tput sgr 0
                if [ "$tree_i" -lt 27 ]
                then
                        echo ".... [34m${arr[$tree_i]}"[0m | cut -c -47

                fi
                tree_i=`expr $tree_i + 1`
                cd "$Tree"
                tree "3" "${#arr[*]}" "$z"
                cd ..
                z=1


            else
                arr[$tree_i]="+ $Tree"
                arr1[$tree_i]=$z
                arr2[$tree_i]=0
                tput cup `expr $tree_i + 3` 72
                tput sgr 0
                if [ "$tree_i" -lt 27 ]
                then
                        echo ".... [34m${arr[$tree_i]}"[0m | cut -c -47

                fi
                tree_i=`expr $tree_i + 1`


            fi
        elif [ -f "$Tree" ]
        then
            arr[$tree_i]="$Tree"
            arr1[$tree_i]=$z
            tput cup `expr $tree_i + 3` 72
            tput sgr 0
            if [ "$tree_i" -lt 27 ]
            then
                if [ "`echo "$Tree" | grep ".zip$"`" ] || [ "`echo "$Tree" | grep ".gz$"`" ] || [ "`echo "$Tree" | grep ".tar$"`" ]
                then
                        echo ".... [31m${arr[$tree_i]}"[0m | cut -c -47
                        arr2[$tree_i]=1
                elif [ -x "$Tree" ]
                then
                        echo ".... [32m${arr[$tree_i]}"[0m | cut -c -47
                        arr2[$tree_i]=2
                else
                        echo ".... ${arr[$tree_i]}" | cut -c -47
                        arr2[$tree_i]=3
                fi
            fi


        tree_i=`expr $tree_i + 1`
    fi
done
fi
}

Tree_Cursor() {
    v=0
    L=3
    x=0
       tput sgr 0
       tput cup $L 72
      echo "....`tput setab 1` ${arr[$x]}" | cut -c -`expr 51 - ${arr1[$x]} \* 4`
      tput sgr 0

    while [ 1 ]
    do
       tput sgr0


        read -sn 1 tree_key
        if [ "$tree_key" = '' ]
        then
            #tput setab 8
            tput cup $L 72
           x=`expr $L - 3`
           while [ $v -lt ${arr1[$x]} ]
           do
               echo -n "...."
               v=`expr $v + 1`
           done
           v=0
           if [ ${arr2[$x]} = 0 ]
           then
               echo [34m" ${arr[$x]}[0m" | cut -c -`expr 47 - ${arr1[$x]} \* 4`
           elif [ ${arr2[$x]} = 1 ]
           then
               echo [31m" ${arr[$x]}[0m" | cut -c -`expr 47 - ${arr1[$x]} \* 4`
           elif [ ${arr2[$x]} = 2 ]
           then
               echo [32m" ${arr[$x]}[0m" | cut -c -`expr 47 - ${arr1[$x]} \* 4`
           elif [ ${arr2[$x]} = 3 ]
           then
               echo " ${arr[$x]}" | cut -c -`expr 47 - ${arr1[$x]} \* 4`
           fi
          #echo " ${arr[$x]}" | cut -c -`expr 47 - ${arr1[$x]} \* 4`

            read -sn 1 tree_key
            read -sn 1 tree_key

            if [ "$tree_key" = "A" ]
            then
                L=`expr $L - 1`
                if [ "$L" = 2 ]
                then
                    L=3
                fi


            elif [ "$tree_key" = "B" ]
            then
                L=`expr $L + 1`
                if [ $L = `expr ${#arr[*]} + 3` ]
                then
                    L=`expr ${#arr[*]} + 2`

                fi
                if [ $L = 30 ]
                then
                    L=29
                fi
            fi

            tput cup $L 72
           x=`expr $L - 3`
            #tree1 "${#arr[*]}" "`expr $L - 3`" "4"

             while [ $v -lt ${arr1[$x]} ]
             do
                 echo -n "[0m...."
                 v=`expr $v + 1`
             done
             v=0
             tput sgr 0
             echo `tput setab 1`" ${arr[$x]}" | cut -c -`expr 47 - ${arr1[$x]} \* 4`
             tput sgr 0


        elif [ "$tree_key" = "" ]
        then
            tree_i=0
            tree1 "${#arr[*]}" "`expr $L - 3`"
            tput cup $L 72
            while [ $v -lt ${arr1[$x]} ]
            do
                echo -n "[0m...."
                v=`expr $v + 1`
            done
            v=0

             echo `tput setab 1`" ${arr[$x]}" | cut -c -`expr 47 - ${arr1[$x]} \* 4`

        elif [ "$tree_key" = "r" ]
        then
            break
        fi
    done



}

Info() {

    tput cup 31 1
    echo "File name : "$1" " | cut -c 1-118
    tput cup 32 1
    if [ -d "$1" ]
    then
        if [ "$1" = "2015726056-TrashBin" ]
        then
            echo "File type : [33mTrashBin[0m"
        else
            echo "File type : [34mdirectory[0m"
        fi
    elif [ -f "$1" ]
    then
        if [ -x "$1" ]
        then
            echo "File type : [32mexecutable file[0m"
        elif [ "`echo "$1" | grep ".zip$"`" ] || [ "`echo "$1" | grep ".gz$"`" ] || [ "`echo "$1" | grep ".tar$"`" ]
        then
            echo "File type : [31mcompressed file[0m"
        else
            echo "File type : regular file"
        fi
    fi
    tput cup 33 1
    if [ -d "$1" ]
    then
        echo "File size : `du -sh "$1" | cut -f 1`"
    elif [ -f "$1" ]
    then
        File_size=`stat -c %s "$1"`
        File_qio=0
        File_mod=0
        if [ $File_size -ge 1024 ]
        then
            File_quo=`expr $File_size / 1024`
            File_mod=`expr $File_size % 1024`
            if  [ "$File_quo" -ge 1024 ]
            then
                File_quo=`expr $File_quo / 1024`
                File_mod=`expr $File_quo % 1024`
                File_mod=`expr $File_mod / 1000`
                if [ "$File_quo" -ge 1024 ]
                then
                    File_quo=`expr $File_quo / 1024`
                    File_mod=`expr $File_quo % 1024`
                    File_mod=`expr $File_mod / 1000`
                    echo "File size : $File_quo.$File_mod G"
                else
                    echo "File size : $File_quo.$File_mod M"
                fi
            else
                File_mod=`expr $File_mod / 1000`
                echo "File size : $File_quo.$File_mod K"
            fi
        else
            echo "File size : $File_size B"
        fi
    fi
    tput cup 34 1
    year=`stat -c %x "$1" | cut -f 1 -d '-'`
    month=`stat -c %x "$1" | cut -f 2 -d '-'`
    day=`stat -c %x "$1" | cut -f 1 -d ' ' | cut -f 3 -d '-'`
    time=`stat -c %x "$1" | cut -f 2 -d ' ' | cut -f 1 -d '.'`
    Month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
    echo "Access time : ${Month[`expr $month - 1`]} $day $time $year"
    tput cup 35 1
    echo "Permission : `stat -c %a "$1"`"
    tput cup 36 1
    echo "Absolute path : `pwd`/"$1"" | cut -c 1-118
}

Total() {
    dir=0
    sfile=0
    file=0
    total=0
    tsize=`du -sh`
    for temp in *
    do
        if [ -d "$temp" ] && [ "$temp" != "2015726056-TrashBin" ]
        then
            dir=`expr $dir + 1`
        elif [ -f "$temp" ]
        then
            if [ -x "$temp" ] || [ "`echo "$temp" | grep ".zip$"`" ] || [ "`echo "$temp" | grep ".gz$"`" ] || [ "`echo "$temp" | grep ".tar$"`" ]
            then
                sfile=`expr $sfile + 1`
            else
                file=`expr $file + 1`
            fi
        fi
    done

    total=`expr $dir + $sfile + $file`

    tput cup 38 30
    echo -n [0m"Total: $total, Directory: $dir, SFile: $sfile, Nfile: $file, Size: $tsize"
}
Frame
Cursor

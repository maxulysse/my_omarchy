echo "Will overwrite:"
for i in `find assets/ -not -type d`; do
    echo "  - ${i/assets/'~'}"
done

rsync -a assets/ ~/
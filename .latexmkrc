# --- Engine / basic options ---
$latex  = 'platex -interaction=nonstopmode -file-line-error -halt-on-error -shell-escape %O %S';
$bibtex = 'pbibtex %O %B';
$biber  = 'biber %O %B';

# --- Output mode ---
# 3 = "pdfdvi": platex -> dvi -> dvipdfmx
$pdf_mode = 3;

# dvipdfmx command
$dvipdf = 'dvipdfmx %O -o %D %S';

# --- SyncTeX (optional but useful locally) ---
$latex .= ' -synctex=1';

# --- File handling / robustness ---
$always_view_file_via_temporary = 1;

add_cus_dep('bcf', 'bbl', 0, 'biber');
sub biber {
    my ($base_name, $path) = fileparse($_[0]);
    return system "biber $base_name";
}

# --- Clean target extensions ---
$clean_ext = 'acn acr alg aux bbl bcf blg dvi fdb_latexmk fls glo gls idx ilg ind ist loa lof log lot nav out run.xml snm synctex.gz toc vrb xdy';

$warn_if_references = 1;
$warn_if_undef = 1;

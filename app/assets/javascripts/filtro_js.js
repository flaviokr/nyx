$(document).ready(function() {
    $('#daterange').daterangepicker();
    table = $('#filtro').DataTable( {
        initComplete: function () {
            this.api().columns().every( function () {
                var column = this;
                var select = $('<select><option value=""></option></select>')
                    .appendTo( $(column.footer()).empty() )
                    .on( 'change', function () {
                        
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
                        column
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
                column.data().unique().sort().each( function ( d, j ) {               
                    select.append( '<option value="'+d+'">'+d+'</option>' );
                });
            } );
        }
    } );

    //Função de filtragem de data
    $('#daterange').on('apply.daterangepicker', function(ev, picker) {
        data_inicio = picker.startDate;
        data_fim = picker.endDate;

        $.fn.dataTable.ext.search.push( function( settings, data, dataIndex ) {
                    return (moment(data[6]) >= data_inicio) && (moment(data[7]) <= data_fim) ? true : false
                });

        table.draw();
        $.fn.dataTable.ext.search.pop();
    });
    //Fim Função de filtragem de data
});
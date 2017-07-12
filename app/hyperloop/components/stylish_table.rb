class StylishTable < Hyperloop::Component
  render(DIV) do
    TABLE(class: 'table table-bordered') do
      THEAD do
        TR do
          TH { 'First Name' }
          TH { 'Last Name' }
          TH { 'Username' }
          TH { }
        end
      end
      TBODY do
        TR do
          TD { 'Mark' }
          TD { 'Otto' }
          TD(class: 'text-success') { '@odm' }
          TD { BUTTON(class: 'btn btn-primary btn_sm') { 'Edit' } }
        end
      end
    end
  end
end

class OrderPdf < Prawn::Document
  def initialize(order, view)
    super(top_margin: 70)
    font_families.update("Arial" => {:normal => "#{Rails.root}/app/assets/fonts/ArialCE.ttf"})
    font "Arial"
    @order = order
    @view = view
    @a = view
    top
    order_number
    right_top
    nabywca
    odbiorca
    line_items
    total_price
  end

  def top
    full_doc = "#{Rails.root}/public/logo.png"
    image full_doc, :at => [0, 720], :scale => 0.65
    move_down 10
    stroke_horizontal_rule
    move_down 30
    stroke_horizontal_rule
    move_down 0
  end

  def right_top
    move_down 0

    draw_text "#{@view.current_admin.fullname}", :at => [400, 715], :size => 10
    draw_text "#{@view.current_admin.zip}"+" "+"#{@view.current_admin.city}", :at => [400, 705], :size => 10
    draw_text "#{@view.current_admin.street}"+" "+"#{@view.current_admin.number}", :at => [400, 695], :size => 10
    draw_text "NIP: " "#{@view.current_admin.nip}", :at => [400, 685], :size => 10

  end

  def nabywca
    move_down 30

    table(nabywca_item, :cell_style => {:size => 8, :align => :center, :width => 250, :border_lines => [:dotted], :background_color => 'DDDDDD'})
    table(nabywcax_item, :cell_style => {:padding => [0, 0, 0, 5],:size => 8, :height => 12, :width => 250, :border_lines => [:dotted], :background_color => 'FFFFFF'}) do |t|
      t.cells.border_width = 0
      t.before_rendering_page do |page|
        page.row(0).border_top_width = 1
        page.row(-1).border_bottom_width = 1
        page.column(0).border_left_width = 1
        page.column(-1).border_right_width = 1
      end
    end
  end

  def nabywca_item
    [["Nabywca"]]
  end

  def nabywcax_item
    [["#{@order.client.try(:firstname).present? ? @order.client.try(:firstname) : "" }"],
     ["#{@order.client.try(:adress).try(:company_zip).present? ? (@order.client.try(:adress).try(:company_zip) + " " + @order.client.try(:adress).try(:company_city)) : @order.client.try(:adress).try(:zip).present? ? (@order.client.try(:adress).try(:zip) + " " + @order.client.try(:adress).try(:city)) : "" }"],
     ["#{@order.client.try(:adress).try(:company_street).present? ? @order.client.try(:adress).try(:company_street) + " "+ @order.client.try(:adress).try(:company_number) : @order.client.try(:adress).try(:street).present? ? @order.client.try(:adress).try(:street) + " " + @order.client.try(:adress).try(:number) : ""}"],
     ["#{@order.client.try(:adress).try(:company_nip).present? ? @order.client.try(:adress).try(:company_nip) : ""}"]
    ]
  end

  def odbiorca
    move_down -65
    table(odbiorca_item, :position => :right, :cell_style => {:size => 8, :align => :center, :width => 250, :border_lines => [:dotted], :background_color => 'DDDDDD'})
    table(odbiorcax_item, :position => :right, :cell_style => {:padding => [0, 0, 0, 5],:size => 8, :height => 12, :width => 250, :border_lines => [:dotted], :background_color => 'FFFFFF'}) do |t|
      t.cells.border_width = 0
      t.before_rendering_page do |page|
        page.row(0).border_top_width = 1
        page.row(-1).border_bottom_width = 1
        page.column(0).border_left_width = 1
        page.column(-1).border_right_width = 1
      end
    end
  end

  def odbiorca_item
    [["Odbiorca"]]
  end

  def odbiorcax_item
    [["#{@order.client.try(:firstname).present? ? @order.client.try(:firstname) : ""}"],
     ["#{@order.client.try(:adress).try(:zip).present? ? (@order.client.try(:adress).try(:zip) + " " + @order.client.try(:adress).try(:city)) : @order.client.try(:adress).try(:company_zip).present? ? (@order.client.try(:adress).try(:company_zip) + " " + @order.client.try(:adress).try(:company_city)) : "" }"],
     ["#{@order.client.try(:adress).try(:street).present? ? @order.client.try(:adress).try(:street) + " " + @order.client.try(:adress).try(:number) : @order.client.try(:adress).try(:company_street).present? ? @order.client.try(:adress).try(:company_street) + " " + @order.client.try(:adress).try(:company_number) : ""}"],
    ]
  end

  def order_number
    move_down -160

    draw_text "FV " + "#{@order.name}", :at => [400, 655]

    move_down 160
  end

  def line_items

    move_down 40

    table line_item_rows do
      row(0).size = 8
      columns(0..7).align = :left
      columns(0..7).size = 8
      columns(0).width = 160
      columns(1).width = 55
      columns(2).width = 55
      columns(3).width = 55
      columns(4).width = 55
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.cell_style = {:border_lines => [:dotted]}
    end
  end

  def line_item_rows

    [["Towar/usluga", "Jednostka", "Ilosc", "Cena Netto", "VAT", "Cena Brutto", "Wartosc Brutto", "Wartosc Brutto"]] +
      @order.product_orders.map do |order|
        [order.name, "szt.", order.quantity, '%.2f' % order.price, "23", '%.2f' % (order.price*order.quantity)]
      end
  end

  def total_price
    move_down 15
    text "Suma: #{'%.2f' % @order.total_price} zł", size: 16
  end

  private

  # def price(n, a)
  #   @view.number_to_currency(n, a)
  # end
end

module ApplicationHelper
  def ie_html
    return <<-IE_HTML
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
IE_HTML
  end

  def google_analytics
    return if Rails.env =~ /development|test/
    g_code = <<-GOOGLE
    <script>
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-19478262-1']);
    _gaq.push(['_trackPageview']);
    (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    </script>
    GOOGLE
  end

  def truncate_words(text, length=30, truncate_string="...")
    return if text.blank?
    l = length - truncate_string.chars.to_a.length
    text.chars.to_a.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
  end

  def relative_date(date)
    return if date.blank?
    date > DateTime.now ? time_ago_in_words(date) : "#{time_ago_in_words(date)} ago"
  end

  def publication_date(date)
    return if date.blank?
    date.strftime("%d %B %Y")
  end

  def issue_date(date)
    return if date.blank?
    date.strftime("%d %b %Y")
  end

  def time_value(date, blank="-")
    return blank if date.blank? || !date.respond_to?(:strftime)

    date.strftime("%H:%M")
  end

  def minute_value(minute, blank="-")
    return blank if minute.blank?

    minute = minute.to_i

    if minute == 60
      "1 hr"
    elsif minute > 60
      "#{minute/60} hrs"
    else
      "#{minute} mins"
    end
  end

  # Use this to represent number of leave days. We want to show '2 days'
  # instead of '2.0' days while still showing 2.5 days if there is any.
  def strip_zero(number)
    return 0 if number.blank?

    num = number.to_s
    num = num.split(".")

    if num.last == "0"
      num.first.to_i
    else
      number
    end
  end

  def link_with_current(label, path, controller_name, action_name, has_sub=false)
    if controller.class.to_s =~ controller_name
      if action_name
        if controller.action_name =~ action_name
          has_sub ? link_to(label, path, :class => "current has_sub") : link_to(label, path, :class => "current")
        else
          has_sub ? link_to(label, path, :class => "has_sub") : link_to(label, path)
        end
      else
        has_sub ? link_to(label, path, :class => "current has_sub") : link_to(label, path, :class => "current")
      end
    else
      has_sub ? link_to(label, path, :class => "has_sub") : link_to(label, path)
    end
  end

  def dollar(figure)
    return number_to_currency(0) if figure.blank?
    number_to_currency(figure)
  end

  def dollar_positive(figure)
    return number_to_currency(0) if figure.blank?
    (figure < 0) ? number_to_currency(figure * -1) : number_to_currency(figure)
  end

  def work_month(month)
    Time.local(2000, month).strftime("%b")
  end

  def work_month_display(date)
    date.strftime("%b %Y")
  end
end
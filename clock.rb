
=begin
# -------------------------------------- Problem ----------------------------
Goal
  Create clock independent of date
  Must be able to add and subtract minutes from the time
  Two clock objects that point to the same time should equal each other

Rules
  No built-in date or time functionality

# -------------------------------------- Understand -------------------------
Model
  "05:00" => 5
  "06:00" => 5, 60
  "00:30" => 0, 30
  "00:30" => 23, 30 + 60
  "08:30" => 10 - 90

# -------------------------------------- Slice ------------------------------
Hours is initially in minutes
Only format hours to hour format with to_s
Must add decimal value to minutes as well (not a clean divide)

OR

Only minutes

Wraparound
  Conditional that checks minute
    Subtraction under 0 then 
    Addition over 60 then 

  Conditional that checks hour



# -------------------------------------- Code -------------------------------
=end

# class Clock
#   def self.to_s
#     total_minutes = @@num.to_f
#     @@hours = (total_minutes / 60).to_i
#     @@minutes = ((total_minutes / 60).modulo(1).round(2)*100).to_i
#     puts @@hours
#     puts @@minutes
#     formatting
#     "#{@@hours}:#{@@minutes}"
#   end

#   def self.at(*num)
#     @@hours_in_minutes = (num[0] * 60)
#     @@i_minutes = num[1] if num[1] != nil
#     self
#   end

#   def self.+(minute2)
#     @@i_minutes += minute2
#     self
#   end

#   def self.-(minute2)
#     @@i_minutes -= minute2
#     self
#   end

#   private
#   def self.formatting
#     @@hours = @@hours.digits.reverse.unshift(0).join if @@hours < 10
#     @@minutes = @@minutes.digits.reverse.unshift(0).join if @@minutes < 10
#   end
# end

# clock = Clock.at(11, 9)
# clock.to_s

class Clock
  def self.to_s
    @@hour = @@hour.digits.reverse.unshift(0).join if @@hour < 10
    @@minute = @@minute.digits.reverse.unshift(0).join if @@minute < 10
    "#{@@hour}:#{@@minute}"
  end

  def self.at(*num)
    @@hour = 0
    @@minute = 0
    @@hour += num[0]*60 if num[0] != nil
    @@minute += num[1] if num[1] != nil
    self
  end

  def self.+(minute2)
    @@minute += minute2
    self
  end

  def self.-(minute2)
    extra = 0
    if @@minute -= minute2 < 0
      extra += (@@minute - minute2)
      @@minute -= minute2
      @@hour -= extra
    else
      @@minute -= minute2
    end
    self
  end
end
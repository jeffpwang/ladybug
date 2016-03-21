class PagesController < ApplicationController

	skip_before_filter :authorize
	
  def home
    @rand_quote = [
     ["Keep your face always toward the sunshine - and shadows will fall behind you.", "Walt Whitman"],
     ["Positive anything is better than negative nothing.", "Elbert Hubbard"],
     ["In order to carry a positive action, we must develop here a positive vision.", "Dalai Lama"],
     ["Positive thinking will let you do everything better than negative thinking will.", "Zig Ziglar"],
     ["Always turn a negative situation into a positive situation.", "Michael Jordan"], 
     ["The best preparation for tomorrow is doing your best today.", "H. Jackson Brown, Jr."],
     ["I can't change the direction of the wind, but I can adjust my sails to always reach my destination.", "Jimmy Dean"],
     ["Try to be a rainbow in someone's cloud.", "Maya Angelou"],
     ["We know what we are, but know not what we may be.", "William Shakespeare"],
     ["Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.", "Buddha"],
     ["Very little is needed to make a happy life; it is all within yourself, in your way of thinking.", "Marcus Aurelius"],
     ["I am not what happened to me. I am what I choose to become.", "Carl Jung"],
     ["Be vigilant; guard your mind against negative thoughts.", "Buddha"],
     ["Softness starts in the mind and then filters through to the body.", "Mel Fleming"], 
     ["When you doubt your power, you give power to your doubt", "Honore de Balzac"], 
     ["Be happy for no reason like a child. If you are happy for a reason you’re in trouble, because that reason can be taken from you.", "Deepak Chopra"],
     ["The pessimist sees difficulty in every opportunity. The optimist sees the opportunity in every difficulty.", "Winston Churchill"]
     ["Don't let yesterday use up too much of today.", "Will Rogers"]
     ].sample
  end

  def about
  end

end

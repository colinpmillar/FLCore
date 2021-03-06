# FLlst-class.R - 
# FLCore/R/FLlst-class.R

# Copyright 2003-2015 FLR Team. Distributed under the GPL 2 or later
# Maintainer: Iago Mosqueira, EC JRC G03
# $Id: FLlst-class.R 1778 2012-11-23 08:43:57Z imosqueira $

# FLlst() {{{
setMethod("FLlst", signature(object="ANY"), function(object, ...){
	lst1 <- list(...)
	nlst <- length(lst1)
	lst <- list()
	length(lst) <- nlst + 1
	lst[[1]] <- object
	lst[-1] <- lst1
	new("FLlst", lst)
})

setMethod("FLlst", signature(object="missing"), function(...){
	if(missing(...)){
		new("FLlst")
	} else { 
		lst <- list(...)
		new("FLlst", lst)
	}
})

setMethod("FLlst", "list", function(object){
	new("FLlst", object)
}) # }}}

# coerce {{{
setAs("FLlst", "list", function(from){
	lst <- from@.Data
	names(lst) <- from@names
	attr(lst, "desc") <- from@desc # check when it's empty insert something
	lst
}) # }}}

Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EDC4438
	for <chrome-platform@lists.linux.dev>; Tue,  4 Oct 2022 22:56:43 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id a2so7549105iln.13
        for <chrome-platform@lists.linux.dev>; Tue, 04 Oct 2022 15:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21aF3xrHX47oLo0sMGUmu36P6Tlgyl21KoRQSXEdHrM=;
        b=cgGYJ6lfrnzD1l8DjimJ35xNcQVig2WjI0sX/wZA1Kt2WrOVb7v6+bBWv8xUTuhKRc
         di2GHl5ueLHpvrFq901ROpowMwn0iakdZinN8bDTO6vM4+Uq/+aic91q2TACJX78KaPn
         JRL+Naq6gR+1vG8IvtcuhQTcQPPGUDXF+2MdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21aF3xrHX47oLo0sMGUmu36P6Tlgyl21KoRQSXEdHrM=;
        b=BjGYgZbZ6hR7QQjzkH28nfY8aWP79tLTg7xbJS/9lDMaoqQ0kN+pEu2yUkRsfSXvs5
         ZU8STB7NjMt8SYdUcRzZg1OKL0LLGA/qkubnHgc/0pJMGAZuJ1wXRVZ0zRoRizLiuGuE
         TpUqJoEiUnxtCA6g/jlmp2yjPgqUuOCNZJYKGctogC4p1mtpVoEiy+vj1vrNkoJ5TJ0W
         vTZ3Ay+mJrGhWl7Q11aLXIEZC5Qfi9Ta6FTJNsjmi/Gbg1s8z6Fq0z8UPYiTJ4VCnDE9
         oQCO/sbCXV8siliYmeFVOx7nt/o3nxf6sydgkewDn2gT3fjpn6Xr9Jgbbq2OZQFG3f7H
         bIfQ==
X-Gm-Message-State: ACrzQf1fhwDMonPWfm72mytx3z+6s2/zy54bPLv0pUej3eE/v7YONnaZ
	f62IJB1KElOYztTnz7Rl9ApiTQ==
X-Google-Smtp-Source: AMsMyM4WTtHSi0Zw5vBdW0BqBDQ7WVxaWnQlFtOUczTGMe69fRh7AxEax+ShD8gBI6Bvp1v50CbEhA==
X-Received: by 2002:a05:6e02:154f:b0:2f9:f2ed:b661 with SMTP id j15-20020a056e02154f00b002f9f2edb661mr4732417ilu.134.1664924202749;
        Tue, 04 Oct 2022 15:56:42 -0700 (PDT)
Received: from chromium.org (c-73-217-34-248.hsd1.co.comcast.net. [73.217.34.248])
        by smtp.gmail.com with ESMTPSA id k42-20020a056638372a00b0035a9b0050easm5720499jav.18.2022.10.04.15.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 15:56:42 -0700 (PDT)
Date: Tue, 4 Oct 2022 16:56:40 -0600
From: Jack Rosenthal <jrosenth@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
Message-ID: <Yzy6KNUHFqxWZb9U@chromium.org>
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com>
 <Yzxl2oczTtwEvIqt@chromium.org>
 <Yzxsu2Ms43eTfOYR@kroah.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yzxsu2Ms43eTfOYR@kroah.com>

On 2022-10-04 at 19:26 +0200, Greg KH wrote:
> On Tue, Oct 04, 2022 at 10:56:58AM -0600, Jack Rosenthal wrote:
> > On 2022-10-04 at 10:51 +0200, Greg KH wrote:
> > > > +		A list of ids known to Coreboot can be found in the coreboot
> > > > +		source tree at
> > > > +		``src/commonlib/bsd/include/commonlib/bsd/cbmem_id.h``.
> > > 
> > > That will not age well, why not point to the reference in the kernel
> > > tree instead?
> > 
> > There is no copy in the kernel tree.
> 
> Then how does the kernel know what to print out?  Why not add such a
> reference somewhere?

The kernel really doesn't need to know the list of possible ids: it
simply reads what coreboot gives it from the coreboot tables and proxies
that on up to sysfs nodes.

In an earlier version of this patch
(https://lore.kernel.org/chrome-platform/CAODwPW-JzXXsEANaS+6n695YqriAQ0j0LXm31R2u1OP3MhX9Uw@mail.gmail.com/T/#u),
I actually had this list so that the directory names were human-readable
instead of using the 32-bit CBMEM id, but Julius didn't like it citing
that we'd have to keep the kernel tree and the coreboot tree in sync.

I'm fine with either solution ... just want to make all parties happy
here =)

> 
> > > >  config GOOGLE_COREBOOT_TABLE
> > > >  	tristate "Coreboot Table Access"
> > > >  	depends on HAS_IOMEM && (ACPI || OF)
> > > > diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/google/Makefile
> > > > index d17caded5d88..8151e323cc43 100644
> > > > --- a/drivers/firmware/google/Makefile
> > > > +++ b/drivers/firmware/google/Makefile
> > > > @@ -7,5 +7,8 @@ obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
> > > >  obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
> > > >  obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
> > > >  
> > > > +# Must come after coreboot_table.o, as this driver depends on that bus type.
> > > 
> > > Doesn't the linker handle this for us?
> > 
> > Not in the case of compiling as a built-in module: I observed in this
> > scenario the order in the Makefile deterimined the module initialization
> > order, and, if this were to be listed alphabetically, the coreboot_table
> > module would not have been loaded before the cbmem module.
> 
> So is this a runtime dependancy or a symbol/link dependancy?
> 
> link one is easy, we always go off of the Makefile order, and if you
> move it and it breaks, well obviously move it back.  If it's a runtime
> order, then how will you handle one being a module and the other not?

link/symbol dependency ... it's just the cbmem driver depends on the
coreboot bus.  Existing EXPORT_SYMBOL facilities should have this
figured out for the module case, but the Makefile just needs to be in
the right order for the built-in module case.

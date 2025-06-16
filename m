Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264AC289835
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097782; cv=none; b=jJIIRYVP7d/MS4KDPHrC3gLmyIm/pvXQVt5wrhajqjeCo4LjHgKEhF00cJmU8eF32tXtP83W+/+bimg0usUeYe7/hpRFbtTEozag/w/PFYRElU5jmugQxAtZ5UK2d6zqTHgjFdlIiDgES/2zCxR7+QtdDmhLS+ZOsfQA8zVgSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097782; c=relaxed/simple;
	bh=hishAlYarzpYkWDiZzcN1tYkTRPdwHa+/Z/vANbUma0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKQkoIRrieph5oN2TSFOmYni8rLkTRaEylEp7vUmKU2TGu/ZDpiyTjL/NwdHPPzB1G1JFjDIKpbaQsUmoeqH/i+gYk+gSXLJtcyciBfrRH6EzdsNwTAvxeaup/FR5Xq3atLtQI29uv1p9cnbJJFUa8eZZacPMEpPa6z9toEzXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fKcOIQdp; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fKcOIQdp"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so3869857a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750097780; x=1750702580; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl8PkghuCWqFkQT5amFIMJEShqvcx+zM//1mjsk79zk=;
        b=fKcOIQdpQjCzXfQMSsGS6D7o4ej8STwXwjPWqTuUN0NM0IXcPi5WCMvON4UKNtIzyP
         S22vdN1+QpCeSQisn3MySGfzb14ZP6rLzG2f2ysdspbD2Oyji7oIwdvoJp2kOFySBTW8
         bEQ1r8lxxVUSeSezeDNXIh9gdO06yIGx8DgR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097780; x=1750702580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl8PkghuCWqFkQT5amFIMJEShqvcx+zM//1mjsk79zk=;
        b=SK8y14PQ9hLSk9TtW0UvURtsPX0fkz2s74nJVSpxqmZaHsBBsJ0pMRlwJ4kVsmM4mC
         l5c5+CPDVqQxK9ItUhsfXnFDS4KIjjRzK+SM9v73LehZ41dA5aYveUOfKCA0dw2Jnxm3
         NQzcrvlrZMHkEUVUWCT2erHkEdg4FaZyJXSFePdK8VYHCmlnIFt1dj5eAASQF07oFqrp
         vovyGOjJ/vXK15JlFZJQHw3jw+oeoNP3+/5ePx20u/Ar8+Ik5yQ1QjrKLnK5ZlS3gvX6
         kYEgKMu8pdCNy0Vl/12m6s/5UpnrEx+X+zABgQAiyjnCCLwYbew+7usZ2EuytYV25Z4Z
         qb/w==
X-Forwarded-Encrypted: i=1; AJvYcCUpT6O8TARSbZGWRZJAVna255YdLEaoYevuedWSt63jlzEbiTj7o3b4ut75LS/mLbu2N7++5DRO6d33gSemCbQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz1HtOyAgO6DO9RXtgzUCcGZIfTXZRxe+YjaMkMFqvrthftSZM
	fsecgAlWo8xi6oVO+ZLTtz3jqxgDQT6gzcD7f/vHdNTJ5b1MuEb39H+JZSflN7oClLQ++lGhn3s
	wcG4=
X-Gm-Gg: ASbGncuJkpQNE910ILnG7G1qP4jojKykteQmgjNfMHaxZN36277647nTpclgx0BiGEa
	dHcB6C8c0ZaCG9BtN5kBzmPECcJtgZgoJhUyy+0QV6jyEMymMa+o8R2VYiG5GtX5CvCeQCetWUh
	LmnBqVNxUmhpHYp6eagA9BBUQGzrx8lCAPvbQPF103VKmVjONwKAxxD9OK3O9qkGZ0siZD521Wf
	F5N+r+W5AjolEs7AojpBXJIeed0Px0t1sg8J0mPl+HjnYNClqEj/jKsQJxvQPqgnZ/K5Fdo4B/a
	YXnke29tJ+TDJ6464VV0LQ8phnnQwKBtZ4uL28iHYl39Jnqe2LRyrYKEGI/K9/DaWuL7U2+FyWS
	ItaVyZ08sbYZxeqE0drz6ha8=
X-Google-Smtp-Source: AGHT+IF21Fesko939SBPpCgWRIkPS1DA0RmshZONlWsh46qwm4hB/VYq64E4e1CY0dJS7UBmNcE4vQ==
X-Received: by 2002:a05:6300:614a:b0:21f:51ea:5c57 with SMTP id adf61e73a8af0-21fbd4cd474mr15723881637.16.1750097780283;
        Mon, 16 Jun 2025 11:16:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:89ef:e9ef:a9e:d5b3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1642ecfsm7234288a12.19.2025.06.16.11.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:16:19 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:16:18 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aFBfcg7E38ywGD5W@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
 <aEtWtBKfNhDT1bF9@google.com>
 <aE1wvuamXqVTzpny@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE1wvuamXqVTzpny@cyber-t14sg4>

On Sat, Jun 14, 2025 at 02:53:18PM +0200, Michal Gorlas wrote:
> On Thu, Jun 12, 2025 at 03:37:40PM -0700, Brian Norris wrote:
> > > @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
> > >   * boilerplate.  Each module may only use this macro once, and
> > >   * calling it replaces module_init() and module_exit()
> > >   */
> > > -#define module_coreboot_driver(__coreboot_driver) \
> > > +#define module_coreboot_driver(__coreboot_driver)                  \
> > >  	module_driver(__coreboot_driver, coreboot_driver_register, \
> > > -			coreboot_driver_unregister)
> > > +		      coreboot_driver_unregister)
> > 
> > You're making arbitrary whitespace changes in this hunk. Try to avoid
> > that, please.
> > 
> 
> Sure, will do. It came from a style warning when running
> scripts/checkpatch.pl. I thought it could be useful to fix it on the
> same go.

That's odd, I don't see any such warning. Anyway, typically I'd expect
such things not to be lumped together under the "separate your changes"
guidance of Documentation/process/submitting-patches.rst (if they're
worth changing at all), although that may not be a hard and fast rule.

Brian

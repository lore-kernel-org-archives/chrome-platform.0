Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF98F2F0C43
	for <chrome-platform@lists.linux.dev>; Thu,  4 Sep 2025 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994789; cv=none; b=hq9ctJNFCHsVulINmreKCA39mtW2o1PqDqWVuZM/w3O9F1+wScM9zcETk9Pq+rOu854/TWjXRoClm7Du6MQw1Ad5rRzmg6qgN2M/TodOlRxaJuF+K+KvImhMCS2mA533T6GLUHVV61V+FupDFAssKGiVzub8hSmH6SptPC9keNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994789; c=relaxed/simple;
	bh=e7u5z2geXOmINqkIDOhhFeHO5so4W2iVgskRRd7gL5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jccKygy0mbZKsByljkftpdT8eO3ZceJk7gq5blzOjDShinj3z+vVMQ6nt0BoPfKVKzLsdEufMTCAkKtX24Fo6kOv2wTYkh/xBkMoL0qVgE2MB/fCRlkCZ4kANDxZkyauTNVX1hdfuMOKqS8UUZvVkcK6qNeBn8n17Ne18QTLWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+/Xr0oN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+/Xr0oN"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77246079bc9so1284164b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 04 Sep 2025 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994787; x=1757599587; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+3rSnC1ctBUpLC6xRDn/aduZQO5mYlu5dXsw2qKG24=;
        b=Z+/Xr0oNex1ne4G93XPZaglRlGFSVRZKyNu5o/YsopRESOqRrAacoOIlS3TNAYkSvq
         S38IbNhfFFBpEPXbWPpgQP0VAXsQZcJJhbCYTSXuoCKFqWD5s7lhl46TAGOzzw/cpjvZ
         gVJROo5rnxMf+j+0cSqLGTjeGGomygGQhzo1P/bsASodOiH+ep7WL8NS5g5skcyg2bUV
         esDyQ+VxbAdQjcAY8VKcJ5lNs9H35MgwmBo/ivWA2iMidSjlwvLX07iq0m+IwXyIIqPb
         hcDoFpGIcvOy3O0E/8bReKEOeXFNslQhpAodw77oshE6xJ/l8rS/Zhbe+3zvPhx+H/8A
         FmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994787; x=1757599587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+3rSnC1ctBUpLC6xRDn/aduZQO5mYlu5dXsw2qKG24=;
        b=n6EjNfxGn/1CZtZOj5BtAAArII9o7Lm6MA+8Ixs1GoDHirX4TzcZ/LO4iy8HoqKFnN
         M1oBHhC9XgyO+8QSF5+al2F5J3FJvE7bdJjP1eaURDOj1or3Tc7Rn/sdzKPJu6mjgKy4
         /WuNksufWJYXegFRH+TXiCxjDV49UFz9FpsHYt8/0VzVyfHRuJkfr1wX29wwqcY9nA2M
         DorwuxHeV9f5howWsjwGvthie190UbQlWRnBjXnEPvA5LF5e2h3bdgXGpY0hzNqiWBcJ
         nGN4OWMIwbO4kNpH/jrud6W/OhmrojXPuFx2IomC9fNAHyki4v3vjScL+2xqO3yjMwH6
         7c1w==
X-Forwarded-Encrypted: i=1; AJvYcCV9iUYj4eK9pVv3QIxSOfSqS7DgwMRspacPp1fLBGMIcC8Jo2mwScQJpXeNkgIwMZvwWSBmXPQP0qjuBhm3x1A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJZhRnnGHsn5O9Bb9pu/zQRNhoBI+fzxaVxytKKl8kd/OWPlm9
	Z5KdbdfUbx6hwFUYWTE0WUwgrwhEGwDp8AoQnf9wQ0qmowUUhqmO8ogF
X-Gm-Gg: ASbGncujU5FOxn9iBwhek990vROqBpKR/5W97XJmaFOVP+WlptZ/gS7tl2KZNG9IXi3
	RRQ4iqSJI6k3ctgMVaQ8ukRmq+fEeUR5ntyQT6I63g49U1BG2ZcwM4eqnXE1nF1eh/av/UqJjJ/
	6gTl4iPECV8zm6MeRLk4DMUe0EIdOeF/PTI54YFgwXEhvyI/Vv9jO2ylsvukl7H8geyY1r1XVle
	BwJ75HJl+QSIduWKsqMh46PBHvd254EcNDS/Q5Dqo/ouxno7KYYtaSDsP2gyAffs0m7hPIDrUgv
	Xc4XFRFLt9QpqpU3Etjf7ACSJFDK/77oKplXJOwWRwyvQOzR9oOPNZv43E++MXX6rWf8htxPK4r
	RuM3h+zbR2Ko6ikMSvgiDQA0=
X-Google-Smtp-Source: AGHT+IFnjbMbw3puYxXAtqTmAfBZ+PbSsGIu/mKvHAuj21P2R2p+8F45+1w7VRRvLnKF54BRxKirTA==
X-Received: by 2002:a05:6300:218a:b0:243:c6d1:776c with SMTP id adf61e73a8af0-243d6e0625bmr25847874637.21.1756994786864;
        Thu, 04 Sep 2025 07:06:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0164c38sm16961113a12.10.2025.09.04.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:06:26 -0700 (PDT)
Date: Thu, 4 Sep 2025 07:06:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <4gtrvxpo6zqk54uvavrox7hszszdpvdubz4w6iaks72zq3jjsw@b6cfvi5ysj2u>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
 <aLGhLCc9UQWwBz47@tzungbi-laptop>
 <aLbutygmfjV4AuhZ@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLbutygmfjV4AuhZ@tzungbi-laptop>

Hi Tzung-Bi,

On Tue, Sep 02, 2025 at 09:18:47PM +0800, Tzung-Bi Shih wrote:
> On Fri, Aug 29, 2025 at 08:50:01PM +0800, Tzung-Bi Shih wrote:
> > On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> > > On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > > > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > > > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > > > probed at the same time.
> > > > 
> > > > Example:
> > > > 
> > > > + -----------------------------------------------------------------+
> > > > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > > > + -----------------------------------------------------------------+
> > > > | Probe cros-ec-keyb.            |                                 |
> > > > | - Decide to defer[1].          |                                 |
> > > > |                                | A device bound to a driver[2].  |
> > > > | Probe cros_ec_lpc.             |                                 |
> > > > | - Init the struct[3].          |                                 |
> > > > |                                | Retry cros-ec-keyb from the     |
> > > > |                                | deferred list[4].               |
> > > > |                                | - Won't defer again as [3].     |
> > > > |                                | - Access uninitialized data in  |
> > > > |                                |   the struct.                   |
> > > > | - Register the device.         |                                 |
> > > > + -----------------------------------------------------------------+
> > > > 
> > > > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > > > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > > > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > > > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > > > 
> > > > Note that the device link[5] can't help as in the observed environment,
> > > > the devices are already added via device_add()[6].
> > > > 
> > > > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > > > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > > > 
> > > > The series fixes the issue by ensuring the struct is ready for accessing
> > > > before continuing to probe cros-ec-keyb.
> > > 
> > > Why is the keyboard platform device instantiated before the transport
> > > (cros_ec_lpc) is done initializing? I think this is the root of the
> > > issue...
> > 
> > I may misunderstand but it seems to me:
> > 
> > - The ACPI bus enumerated and instantiated the platform devices[6] first.
> > 
> > - The keyboard platform device was probed when `cros_ec_keyb_driver`
> >   registered.  It deferred as its parent's drvdata was NULL[1].
> > 
> > - The transport platform device was probed when `cros_ec_lpc_driver`
> >   registered.  It set the drvdata[3].
> > 
> > - The keyboard platform device was probed again from retrying the deferred
> >   list, by another thread `deferred_probe_work_func`.  The parent's drvdata
> >   wasn't NULL and cros_ec_register() for the transport device weren't
> >   finished.  The race happened.
> 
> Hi Dmitry,
> 
> Does it make sense to you?

I'll have to research how MFD mixes up statically described and
DT-described platform devices and makes sure that children are not
probed before the parent is ready - I think we need to make cros_ec
behave the same way.

Thanks.

-- 
Dmitry

Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58512E78
	for <chrome-platform@lists.linux.dev>; Thu, 19 Sep 2024 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726776057; cv=none; b=Edur192gG50zzvnkYgL/c5ue4KLr51waVGprymCr7iPjTsQc2Ll27kOF0ZYY9XLZ31tMhUuPGIBrHjlXmWFzJ3lwASljqvqn0ivQVzBhc7oQk1t4Gh2wkrDivJz7lXVstZsK7jTpgCkuzgWbMgSxWuPmPse9Rmy6a/zDkX3W6Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726776057; c=relaxed/simple;
	bh=RFVxadnFs31MpYCZW3HGd22hr61t6wT5W1HJygEmxv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKeBbdzUBrt8J309v6G/Xa+kQG+JYL4+XlzTFOUwGewCUwevFqdgw2mod++DbBjVyIuYPNoFWLeqOM4xjo5/a5/BZz3+e7tJ2ZpOGcl1ARyu9wPARJpwM43LYLtvuVi/9D3SlPIZc6l1H33cOoASLKBagw7Y4mB/8Pt4ZNeGVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wjhA4WC4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjhA4WC4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5356ab89665so1709102e87.1
        for <chrome-platform@lists.linux.dev>; Thu, 19 Sep 2024 13:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726776054; x=1727380854; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaVBunmnbZVdq/qwLaTcD5ybL6Hmaz/2JnQ80TsIRDw=;
        b=wjhA4WC4++4P7+sy7oeoBdg/8YqWBFxjv/RGctax5vrkH1ahHwjkKn+my3yhLBIi6e
         Vo3c0Fc5pNACPINkW0+RJVVvX/vzOGCnSL0DWJ2KPnFVHU6RAcGFT3qlu00sz34iURrh
         1L0msC1/S9kPdYrICtjCxnm04qW/dyUWX3Zjql8p/oQ8NHVFHPNEZ9nlYfM4HBLE3OVz
         6mu5e8k+xVbZLwS6pYQTgMQluSFEreqVxhKT/rMoLSO2eVpk8QMBp38qBisBYeobnlHK
         s7B3O/A7erHBdK41o+3poKbSYDO0OurT5qEG5SNVZeyMj5bcjS7R8xXqJI3fsSBH4StS
         q5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726776054; x=1727380854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaVBunmnbZVdq/qwLaTcD5ybL6Hmaz/2JnQ80TsIRDw=;
        b=ESdm7Oo+obje86UMFYPZAzWYa4yZzLMgeTwR0C3C44bvdn/Ce4cVgPA2cHMgrFYpB5
         RD+E6fPAmcTXnbGQQurDCEvonWgnXQb4/VOibSOuBQ8jdBdqzyW08QL//4xiAQhiET0Y
         ACKdKbqGyIj/6wlIuQYYvPes0LihsPjcBl5OTD+1f7Pp7/GmDG8omZsd0Zzn5AemAvzZ
         FL8eUdoyYdfIxQh6Ods7+uvv4fr91A4YE0h5tf36UtTW/2K4zL7QOH9qi1NfvdC4mM+0
         Bitj5flQjtQcTAlroDMBuRE4yefpjSWx8tiXHzSnH/oIF+GB6KpZBOpag0Zs0mseUpNK
         TglA==
X-Forwarded-Encrypted: i=1; AJvYcCV3qWlLP7NpN+b63uJIftWgTN8ul8V4c38uwoZufM/XeYYTw6yGbIth+qHWFfgOrK8+osYW/qPzxQnnjgbGVDw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDHg7J6qZsGyVsHzg5o/kWvASEYlTykFNp1peaj6TeHwu0j3HM
	sDhLp7sEj9YahMZQE4wZ2Iwjhb1phq5g5skoZo2CZVwJR41im6zI//tHxtb+BPI=
X-Google-Smtp-Source: AGHT+IH/OgvV2NHf628qjdXYPI581cfKDVffxsYLBlLGj2tiaXFgxuBsk9rKqPPRpqHhRmS/LNqQkw==
X-Received: by 2002:a05:6512:39d0:b0:530:e1ee:d95 with SMTP id 2adb3069b0e04-536acf6a767mr90866e87.1.1726776054184;
        Thu, 19 Sep 2024 13:00:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b8c26sm1931392e87.267.2024.09.19.13.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:00:52 -0700 (PDT)
Date: Thu, 19 Sep 2024 23:00:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
Message-ID: <rpdbzy5ldlsq2ahvuyrzx6tprgtgxpftd4xbos7cd3wwnhapvu@2hstbs5qg65h>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com>
 <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
 <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com>
 <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>

On Thu, Sep 19, 2024 at 08:03:37PM GMT, Łukasz Bartosik wrote:
> On Thu, Sep 19, 2024 at 11:38 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Sun, Sep 15, 2024 at 12:08:45AM +0200, Łukasz Bartosik wrote:
> > > On Wed, Sep 11, 2024 at 4:09 PM Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Sep 10, 2024 at 10:15:25AM +0000, Łukasz Bartosik wrote:
> > > > > Add netlink to ChromeOS UCSI driver to allow forwarding
> > > > > of UCSI messages to userspace for debugging and testing
> > > > > purposes.
> > > >
> > > > Why does this need to be cros_ec specific?
> > > >
> > >
> > > You're right. Netlink does not have to be cros_ec_ucsi specific.
> > > Would you like to have netlink in typec_ucsi ?
> >
> > Does it need to be netlink? We would then have tracepoints, the
> > custom debugfs interface, and this netlink interface.
> >
> > I think this information could be exposed via trancepoints (unless I'm
> > missing something).
> >
> 
> Hi Heikki,
> 
> I agree that there is a common area which is covered by both trace
> events and netlink.
> However netlink also has advantages which IMHO trace events lack. One
> of our cases is that
> from userspace it is easy to forward the UCSI messages to a Wireshark
> with a plugin
> which can decode it. Another case is to use UCSI forwarded messages
> through netlink
> for testing and validation of chromebooks.
> 
> How about leaving netlink specific to cros_ec_ucsi driver ? Would you
> consent to that ?

I think having it specific to cros_ec_ucsi is the worst option out of
three. It should either be generified to work with all UCSI drivers or
go away and be replaced by tracepoints (against, generic to all UCSI
drivers) or some other mechanism (e.g. TCPM has rolling log of
messages).

-- 
With best wishes
Dmitry

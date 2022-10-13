Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE64429
	for <chrome-platform@lists.linux.dev>; Thu, 13 Oct 2022 21:26:32 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id 187so2455783iov.10
        for <chrome-platform@lists.linux.dev>; Thu, 13 Oct 2022 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CGvXzyfaWxsSx0ELvyCr5bspehD/xx7xIHWSGqJXxeE=;
        b=CYbwTQUVAFGPDAams5vEG6YANf8ufOlvCE2X2ftvni16//YJRbDjCSYOrdWiFJduzx
         ctwOznzMbaEbqo8W4ciqa64lgUbbHtVvC8wj/1Pb4UsHXGujE5UC+Wt3TFg5pmiziECU
         +ohjP5/CaEnuyHOVYPU3yj/VeZ9TB2/kk7GZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGvXzyfaWxsSx0ELvyCr5bspehD/xx7xIHWSGqJXxeE=;
        b=pAOT6jpTo5PYu4pnEFyGKnXRoRvuaoyMHFbWVAf5zh7O66kcnC+eFaNZxVpNr6K5ib
         6xt8nuive/BMAnxo5JHffmtw1d/P5bLL/2B6+4zY7UgoOoUM6zLjI6HH+s13Xq/O2MKl
         hLgkFuE+bdFFI1HPCEkpvNI8iohdVe3bk97LPETqnHIm3Mrs2WGKehDkdfruo2+UGUAM
         ZZFRd254HuzSiFz3bLE860qIP3eBg7fSr/SsUWuALfcx92EdoCdvsWlO89eitjW8ap5Y
         fYtHZgniS5x+ZovELIVKtWVUw3WJXynTdtMiXmXf/vU1aRrdPLcaDDrapNDr6waXvp8x
         BLqA==
X-Gm-Message-State: ACrzQf27fC9ZiTLjMMRpK8LVo1X0UfTVoAmpZy5wnYIact9d6lT9ZZbx
	fCOWmv40C6vd77dRV9Fhmormqw==
X-Google-Smtp-Source: AMsMyM6KtVBdDryBmZZGXEaJj+snGglJJ7YiOpYo+1PXo788euUX3Trk3uP7t5I90wQPhmYJj7PMZQ==
X-Received: by 2002:a5d:8052:0:b0:6a5:4b18:ac03 with SMTP id b18-20020a5d8052000000b006a54b18ac03mr886396ior.153.1665696392089;
        Thu, 13 Oct 2022 14:26:32 -0700 (PDT)
Received: from chromium.org ([100.107.108.164])
        by smtp.gmail.com with ESMTPSA id y19-20020a056638039300b00363c1d1ac05sm394535jap.27.2022.10.13.14.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 14:26:31 -0700 (PDT)
Date: Thu, 13 Oct 2022 15:25:58 -0600
From: Jack Rosenthal <jrosenth@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Julius Werner <jwerner@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v12] firmware: google: Implement cbmem in sysfs driver
Message-ID: <Y0iCZip0k9WcHgsz@chromium.org>
References: <20221004003811.4075765-1-jrosenth@chromium.org>
 <Yzvz9hn1G8rU4VaO@kroah.com>
 <Yzxl2oczTtwEvIqt@chromium.org>
 <Yzxsu2Ms43eTfOYR@kroah.com>
 <Yzy6KNUHFqxWZb9U@chromium.org>
 <CAODwPW-7Y_CbCch+Y5unH3yJD1T=3epYvqja6w_CB-23C9x9sw@mail.gmail.com>
 <Yz0jVbfDOITZfE9M@kroah.com>
 <CAODwPW8R2uXFJ_5V737Dy8z-WJHUwKkLyG4MW_Q50fs-OFm7Sw@mail.gmail.com>
 <Yz52r89A9JYEICCi@kroah.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz52r89A9JYEICCi@kroah.com>

On 2022-10-06 at 08:33 +0200, Greg KH wrote:
> On Wed, Oct 05, 2022 at 04:26:55PM -0700, Julius Werner wrote:
> > > If the kernel is reporting a value, that value needs to be documented
> > > somewhere.  If the kernel is acting on that value, it needs to know what
> > > those values are.
> > >
> > > In this specific instance it seems that the kernel knows a subset of the
> > > values, and some random userspace tool knows all of them?  Think about
> > > what you would want to see here if you knew nothing about this at all.
> > 
> > The kernel doesn't know any of the values. The kernel is just telling
> > userspace that spaces with these IDs exist and providing an interface
> > to access them, it's not supposed to know what any of them mean.
> 
> Ah, ok, that was not obvious to me, sorry.  If the kernel is just a
> pass-through, no objections.

Does this mean PATCH v13 looks good to you?

thanks,

jack

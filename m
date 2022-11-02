Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652FB29A0
	for <chrome-platform@lists.linux.dev>; Wed,  2 Nov 2022 18:48:07 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13bd2aea61bso21353568fac.0
        for <chrome-platform@lists.linux.dev>; Wed, 02 Nov 2022 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZJlUjmoywLu4Jn3VXKQaPRQMjrLxrDkednVdGcojiw=;
        b=JVbeTp/824oo5yASIOPKcgSUV05qgrHX8c5KhgJ6il6eeK0+sXrXrNSRlAqjmjUKom
         5yJSqNah1oELETUH+vzT/PwTiPzY+FM48OTe/GCIaVHaY42BeNnaL8pvF1V+n3PvcPFX
         PAZxi4bAAyCOXPr8eqvOAcDD7wZ1Qh3LHg77I2WGONHjl4KSXIMTx49W4Asxje81Gm3z
         T1eVrUKkI3HcbII5A1cRXBdNRjv7HVymmpZBBQiDJSDkiZ2dDS9El33hP23/ortELZtF
         9jt7g9qJID8YQxt23mZdb51iqay8g50GNPxCKuuV74JHcGJFscGXgvgn1Ev4rtNYa8Qi
         WdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZJlUjmoywLu4Jn3VXKQaPRQMjrLxrDkednVdGcojiw=;
        b=RuFYC3x5kGA5ZXTbAWEDayUGONCK1PpVke6dRsYc+sWL2xLNi+AlXiHpcc1kb9k+5X
         H5jkJJ7zKclUev6a7eF1zwIQI+vzV/vCBZorwOPIr/vQKY8vepEDucVxLIbBz5Y+rVJv
         FHdY3lmfE2ObAQsFyO9nf8/VCzjC1fgBcVvFfKL+8YXNboS3b59QgM1DUeAGxowEBna2
         BMbL86hAMQSJD5eAzGdDluDRh5nKaJOpJ80qs/3SH6V6nR/PzKSTnoPUGCx0JcVAtM3a
         eDvZfRgxWfHXl5vDQxoPyW/gIBWMwIm69AjpI/UMe4MLbBQVqZYUIwAEz0mXzrrDL+aD
         xKvQ==
X-Gm-Message-State: ACrzQf1vbrqQmeSWYdi3RN7XBOR5tsF41/L8IzV7fmFhzbcsMRZA0hKl
	mJXK8nuDBwufl3VJPuQm5Sw=
X-Google-Smtp-Source: AMsMyM6DcKIwtrXUC1XBuDG2PZz1mpZ0CEVkG0Y+UCQV0oklHkJ2wN9IuLUgx2xb+05nVwRdjVVYgw==
X-Received: by 2002:a05:6870:d210:b0:13b:9601:89fb with SMTP id g16-20020a056870d21000b0013b960189fbmr7193588oac.203.1667414886480;
        Wed, 02 Nov 2022 11:48:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x50-20020a056830247200b0066c7733be43sm801291otr.30.2022.11.02.11.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:48:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Nov 2022 11:48:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <20221102184804.GA1918067@roeck-us.net>
References: <20221029005400.2712577-1-linux@roeck-us.net>
 <Y2ABnbBGSJGM3gSS@mail.local>
 <20221031181913.GA3841664@roeck-us.net>
 <Y2BIv21U7lpN0z23@mail.local>
 <20221031230749.GB2082109@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031230749.GB2082109@roeck-us.net>

Alexandre,

On Mon, Oct 31, 2022 at 04:07:51PM -0700, Guenter Roeck wrote:
[ ... ]
> > > 
> > > On a side note, I tried an alternate implementation by adding a retry into
> > > alarmtimer_suspend(), where it would request a smaller timeout if the
> > > requested timeout failed. I did not pursue/submit this since it seemed
> > > hacky. To solve that problem, I'd rather discuss extending the RTC API
> > > to provide a maximum offset to its users. Such a solution would probably
> > > be desirable, but that it more longer term and would not solve the
> > > immediate problem.
> > 
> > Yes, this is what I was aiming for. This is something that is indeed
> > missing in the RTC API and that I already thought about. But indeed, it
> > would be great to have a way to set the alarm range separately from the
> > time keeping range. This would indeed have to be a range relative to the
> > current time.
> > 
> > alarmtimer_suspend() can then get the allowed alarm range for the RTC,
> > and set the alarm to max(alarm range, timer value) and loop until the
> > timer has expired. Once we have this API, userspace can do the same.
> > 
> > I guess that ultimately, this doesn't help your driver unless you are
> > wanting to wakeup all the chromebooks at least once a day regardless of
> > their EC.
> 
> That is a no-go. It would reduce battery lifetime on all Chromebooks,
> including those not affected by the problem (that is, almost all of them).
> 
> To implement reporting the maximum supported offset, I'd probably either
> try to identify affected Chromebooks using devicetree information,
> or by sending am alarm request > 24h in the future in the probe function
> and setting the maximum offset just below 24h if that request fails.
> We'd have to discuss the best approach internally.
> 
> Either case, that doesn't help with the short term problem that we
> have to solve now and that can be backported to older kernels. It also
> won't help userspace - userspace alarm requests, as Brian has pointed out,
> are separate from limits supported by the RTC hardware. We can not change
> the API for CLOCK_xxx_ALARM to userspace, and doing so would not make
> sense anyway since it works just fine as long as the system isn't
> suspended. Besides, changing alarmtimer_suspend() as you suggest above
> would solve the problem for userspace, so I don't see a need for a
> userspace API/ABI change unless I am missing something.
>

Would you be open to accepting this patch, with me starting to work
on the necessary infastructure changes as suggested above for a more
comprehensive solution ?

Thanks,
Guenter

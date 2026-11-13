Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561789;
	b=BKK46IiEUzoS0Rb8pfd0K05wLuxOu2GG9g02jbPaV5xG7a6pBXh77wWY3RphcAQodRp8
	 UQ6TT9y3IpJWszb7hU42MG7u8mWV9Qvu9EodZq4ZTKpAo6a5/QBra6EaOe7wSfs3csKcy
	 2i6O5pxaULhTEXJm20KufzIh7Lhul8dfjWX40qpgcCuPdkY/TTwZ1Ov5LkD1/ppYzbz7W
	 3rqSHiEw6C/y9KfLc8MembESfeMi7AJ+VYo4MAOYZBXMEFFaClYvhnBUUMRRY0Zrwom1H
	 Izik0Nt2ywvx+PgYkhsWMwiaIYvbBko3YdtgVtEsgZ0we5sXMFiVgCmSpsnD7r1nMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L4U6uoKIPIkNv7imLu7Hv5jSI4mySZg6QE0cGj6iXh0=;
	b=5S/M6cRhHzM3D8OfS7f0LVd4tG97edOMxdX8kJMMYttJqyo4mFpXRN+bH6vrGHGJRPbk
	 uGmsJLfmwLstS68R3iemXQG3bZq/aehmkYcz9yaikgirg6NfURB+Koqms5s4HwBTK8avM
	 MQs9aR9+s3ItWY9BBZvSZrInp4ntst5TCgNdPffBg4XGDMH0fdHuLYObWsvSpRkbaE4MV
	 TDWmsss90bLip+e0apj0G8uC56aOK1K5UTCTtcnnbXD8tLWwAxyfj0zXMmN4IKU+mBOxO
	 kTPvGnklV0GF6lDW5bS8BqAa6Wcg/8VNDzp9c1dX9m3tzPFoDKwkmoewjqYLOJ/nGLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHXuLnZZ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C400606A32E
	for <chrome-platform@lists.linux.dev>; Fri, 13 Nov 2026 09:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C400606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHXuLnZZ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490a0e72588so244428f8f.3
        for <chrome-platform@lists.linux.dev>; Fri, 13 Nov 2026 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561787; x=1795166587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4U6uoKIPIkNv7imLu7Hv5jSI4mySZg6QE0cGj6iXh0=;
        b=tHXuLnZZq++oJEjcm1ur7Xl4Q9+Pc2C7RmVgd1wyxE8ncy/hfvb8TRex6ENRtSNMXs
         dPi73HrUWSiy7lkKTS7kfeMt5RJU8hCXut5PvhNZL6wlh40154qHbibYZ4si+y3vyiyD
         wihwYzUv+fYF4+IzHivmci7QAKj1bfabELP061YHfOwfRy1JBsqnvT8AaN2A1HSoqtVE
         fFu5U/afhHTAp/66MYa1fI4RDNlGPd2ErxZ+AioSw7RBUg4ZpHx2ioI9M5tbWlW8GL17
         ju/uy4R1LdcSMcQicCpXfNH16P0MBLXa/X6Wf1XL6hhl0FSgBO9SwUCm4U+UisdppAw/
         f+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561787; x=1795166587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4U6uoKIPIkNv7imLu7Hv5jSI4mySZg6QE0cGj6iXh0=;
        b=Mm6DkayklmtjfCff5QdfPxoGubYPwfvVeJcuu3Hs/K9YAl1AqWtOrZMwpvQe7YJoLa
         P02EdOJ7LHi6CpLKs3pPpzXUxmxhSw1AbpqR7Cos22FZjS4WnE74BY8LKraalr2Czlm5
         DtHeERsG7LmeDFULrYZtCZb2mS6wfIijo1QJrTNbFksDW0+gSeJpbzrLtxdt4Di9mE1P
         JGpyXmzGB3j93w6SXIcr2LQ5OmrpnDIJc01VmQyL7c5g1+wccA5c9MS+0RRJSmsTp7fJ
         fLkaYlZoW3iIYq5RNl/SNGyaHo2w5OoCeLCfBYZBiOtWCPQ9DzUhtWmnEzH1XDXnFSz9
         ec8g==
X-Forwarded-Encrypted: i=1; AL+hErGVyqBoNW2Su7awmxoVqNdV877RYqPupaMUXKbP6hEDDFrQJgMx7mJX/9Kw9uDBx6n4gtgN6oEIruh/GaJTlaY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9bvzDTTpnNoZldZDvZN8l6M4+gIeSIWN5ODvV92efsduk7D9/k
	MCbvwS2oZjVypT9qKyPiVhxC7egcfOTBrJ/K/Re6VWEtj2RqOa3mGQiX
X-Gm-Gg: AYBFou3JOG8aDd09Uv8YPGqISfNUm+sQdVSvszGYLKl9S6NLfDjiVEnPu+bD58FM4B1
	wN0q+vgrxvtWuaNfNFHwwGLDadSLg2AvPMIqaYo6tgrLOuu6YrhAGS2BAE5lUO+/LhuhDIXjfE/
	V6gMG0NjbubsQs7/fKqtNXqqnV529QUEW0xekgRuIb9wTIgGigE0XKxsKrYLTCtLEPtrVNVfaXc
	KNe13SGw7PPhrClhVC72ALm3+taTg/X3JzniMxGDEDBRxEWqAIE/uJSUOmaTr7uAHKJmhSpS6TN
	vM6/Z+0C1QGFSHi+Ki8doARC8TEvUodQs3K2Cf6ELY5AyNkZlgPDyG2SYNkRnnBpAiZ9q0tgPOQ
	8J+LV/89dimzFwWmOcoXQHvYoU4XMbQyO7ORtgbr4eJI9kK/avOBnvvA+WGBCdyyAGROTTqpTbs
	xoRELhTuF1TElDILE50hK2HPpGj0Uj2jATazWTKuzeZxXIBdGbnmS0BjmZeW7AdH/bDuyBaO4Qi
	zpJJt2cu6G8GjcxXoEw8FCO/ZqIRrnEKQkKqsZqmXxCePg2i/iDByXME9hNxtecyD9lbw7TSjWj
	n/v+funG/C/NcmWzff/qVf3kHYhM+PqAsJgfFq7mH1rM/eTbWvxfm0YfVwS++NgzAQ==
X-Received: by 2002:a05:6000:4305:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-49c712ac8cbmr4676987f8f.20.1794561786746;
        Fri, 13 Nov 2026 01:23:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm3853502f8f.12.2026.11.13.01.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:23:06 -0800 (PST)
Date: Fri, 13 Nov 2026 09:23:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Di Wu <diwux@google.com>,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <20261113092305.00ec8be5@pumpkin>
In-Reply-To: <20261113013646.4c2f8456@jic23-hlaptop>
References: <20261111072608.3490763-1-diwux@google.com>
	<avR-KT-6e77EexZn@ashevche-desk.local>
	<20261112020439.37b0da70@jic23-hlaptop>
	<20261112220218.1adae5e5@pumpkin>
	<20261113013646.4c2f8456@jic23-hlaptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 01:36:46 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu, 12 Nov 2026 22:02:18 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Thu, 12 Nov 2026 02:04:39 +0000
> > Jonathan Cameron <jic23@kernel.org> wrote:
> >   
> > > On Wed, 11 Nov 2026 16:39:37 +0200
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > >     
> > > > On Wed, Nov 11, 2026 at 07:26:08AM +0000, Di Wu wrote:      
> > > > > Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> > > > > and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> > > > > PAGE_SIZE limit and is the preferred helper for show callbacks.        
> > > > 
> > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > 
> > > > ...
> > > >       
> > > > > -	return sprintf(buf, "%d.%06u\n",
> > > > > -		       latency / 1000,
> > > > > -		       (latency % 1000) * 1000);
> > > > > +	return sysfs_emit(buf, "%d.%06u\n",
> > > > > +			  latency / 1000,
> > > > > +			  (latency % 1000) * 1000);        
> > > > 
> > > > As David said, since you touched these lines, make the less amount of them
> > > > while at it.
> > > > 
> > > > (But no need to resend, usually Jonathan is kind to tweak this small thing.)
> > > >       
> > > Done and applied.
> > > 
> > >     
> > 
> > I just looked at that line again.
> > Why is it multiplying the remainder by 1000?
> > It could be:
> > 	return sysfs_emit(buf, "%d.%03u000\n", latency / 1000, latency % 1000);
> > if the 6 digits after the decimal point are required.  
> 
> Good point, I guess unrelated change that we could have on top.

Indeed.

> Those trailing zeros shouldn't matter.

There is a matching oddity in the set function (just above).
It calls iio_str_to_fixpoint(buf, 1000000, &integer, &fract)
then does latency = integer * 1000 + fract/1000.
Just replace the 100000 by 1000 and you don't need the divide.

iio_str_to_fixpoint() will ignore are extra fractional digits.

Although I'm not at all sure its handling of negative value is correct.
It converts -1.5 to -1/5 and -0.5 to 0/-5.
I can't see how that is useful since i*10+f for both gives -5.

I'd have though that either the fractional part should always be positive
so -1.4 would need converting to -2/6 or it would have the same sign as
the integer part and -1.4 would be converted to -1/-4.

David

> 
> > 
> > David  
> 


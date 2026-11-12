Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520943;
	b=QysYUnmvT22hUQ8HY6jk+TYdq+62UNbDbRHsUHpWdmaDDAH6vo7Ocm9tiVbewTg+2qcz
	 3zm/9V4ulSamzDQn0LzC4PmTnWBQdC1Gp3wH7FCI3x3BH2zpi45yX2uG/xyuBLg1vcFPF
	 IJHjic80T+POjqEJdMk43gzVLKzsPYT08JPrlMBFYyOlm4xVxbsgNLCk+Iz0nqZYhb2YL
	 eiV94e57Q9X+Rj6jPnl9ZmXBnwL5QSl17D1kfUuYQJRSjhOeduWk62eyJIZU6LPumWf6T
	 FqRUPbsxfseCNVV626iCaYSs9Zp1+Mu1Va1vJT6qkak/gME5ITqjZ7Vy3STocnMCaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KkjN1cxceCxoRkdu1/EYi0tZwQkA6fRy7dyW7MOKnbU=;
	b=T4KcYTjS1JO1/ivr1/AbfuP2Qs1hTZhGnBUjw9JYjRNVL7eigCnboL8fRITbOHheSS1g
	 2K4D2cv3mXTfX7qTMBaAzPpB1lAzXkEHuqLdxqEjQemlfmDJsHIlJoQnnQi+T5PQZKt3T
	 F6UBvP9I9a0c9svEf/6/eI/WDGBR2u2o9azSjfPCD8BkDDDyBI54+V0Y4KKCGJ68zlqOE
	 BRn8q46cuGWJECKJyMDybddK01Sl8NgTfyoBz+7mXrY7s9s6vXLeODH7+8aACsGTsIjCx
	 6TQSH6b7S5WkukLYvPcg6oUC2t0fv9toeB1Knj2GrHxCW26FYIyt3RXVzjlZGtNAE7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLRGAPKa;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD4606A321
	for <chrome-platform@lists.linux.dev>; Thu, 12 Nov 2026 22:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88DD4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLRGAPKa
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so307530f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 12 Nov 2026 14:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794520941; x=1795125741; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkjN1cxceCxoRkdu1/EYi0tZwQkA6fRy7dyW7MOKnbU=;
        b=xLRGAPKa2U2vpKSdNqcEuMS8aTOUa6Ofd7OIid4+SgRwPgvjkttEX1eLl+F6SGHwcU
         P2mI4xTJI/dbOYNVIctoow0gjrixM7MNwYRHKl3/xBxt/VSW8f1a+BnSpWBWslq1HlLS
         aEd3XhVXSXPlk/He2AHyx2UTLBwwI+OZ7AZQjuBwF5R9INakfc1NP1X5BGl4hYdJL0ec
         prCmpMT/azuDk9ELpZwaFjXX2TZAxL5F2SWNBjsqkoHpXPcp7pMB+ZOs+mRDihCSS2bq
         gVrA3ajlAaM1rF5gKAZOKFpDZbS8fD69VHZeu+UjMZZWhO/HKw0t+ObheywytilTTWHq
         Gbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520941; x=1795125741;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkjN1cxceCxoRkdu1/EYi0tZwQkA6fRy7dyW7MOKnbU=;
        b=h/SzdkksKEFs573FYC1zdCha/Nos3e7l92fLGwBCioSabnqrnbVP5cU1sHd+DpKzEA
         JSBiTK8Fk/pq936iiIpMSkLIS8LNt7pGDM7trjGIcrtn8N9vR5rogZKqvZmtozRMdPnd
         1CLXBcXJYGbsJHe0wYqM+m2K8Go+NoAl/xy4q2s7Wh4UVcKTek0rxoKuakpaq0Or2eXt
         Jj4QUUCbwkXmiv+CxvxYqHwknkuh1gEbDI5/4GV34Eyrx4L+PQ5HVX833nkQF2Gbm7AM
         sLzuWaB60xwBCRhv0++7gdIFA3M0chPpHBwCFgET16YYBXD2QZaaxR9zwkIf8lOXBHuF
         nJTA==
X-Forwarded-Encrypted: i=1; AL+hErFCeSq3SjYnMXH2IU/X9zvnlHRkhuv18jFldhYcuMPwm2PVC0VK3Gzjemk+s0qH4ADTMxtAyuPcQ9vYlRky+v8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/N9XF9zAODJYW8UtSvfoaMk5O9i5dm6wb5vLsqP88HvIdHLVRf
	Okp4cFJ8cxCGqWuMAy9mTgELvKjqF0bFQ58yc146XisnuESiBva74OnN
X-Gm-Gg: AYBFou2+GuCg5KFqUsEhl8yxMVVIsg8RuhNui+IQuZa9s34l6nwZaOBjXj8DEB/frOj
	/KJRIKV9wa6/v24ZAtkQU8kb2H6A/N/k3vU4qKy6jcaQQGA0x0rxaCO9U1iVT277pTlATrEWCIk
	cxUhknFiIEkoRVQLxeS4Od2AMnFiyBow0j2C6Z7Q3SUdWWtddoqGasnfM4xWHm5EWOYtGYSlCcK
	9mttkwk5AkGy3T2LUagL7/g4SLlDbrMKjdHBm4YiS20rIGy/5N6C0oe0S4B/4xvBPc59IhAJGrB
	q7ft6OP/jRef2bJiXSFXkDAb6iAbDvUpdwgmuFIfgMn52MDofRo3eeGTZgV/L5Xg09WrppW/L7D
	2qu9yvhN6yrjnWePhCGVOYOg/Tax3dAy4oup+3JoQH6clYfpgP8xanwtxLBYExw91TLDXO8GmwJ
	yCy26hzZyiGffpaxnRFy97GawuswoeoiJ8JG/YKs1ipwHMWdLJy/yfNp01Ih13hxCNTC1V5YBvq
	fArmhYwPwQt3T2+/2Tks4lNuBRmQd3gHMBuSPSjpJXJulVw4ZAGT3wmnmIulDQ9WV+7m/M5vHrg
	1CNXUr0cxulyCRIsBnyzevkoywxgqJ4HNFQTKiwRTuW02RvubGXpVqC6lqhf4o5xGQ==
X-Received: by 2002:a5d:5d07:0:b0:48f:e879:5890 with SMTP id ffacd0b85a97d-49c727d1ea8mr1719571f8f.32.1794520940752;
        Thu, 12 Nov 2026 14:02:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm1796040f8f.1.2026.11.12.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:02:20 -0800 (PST)
Date: Thu, 12 Nov 2026 22:02:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Di Wu <diwux@google.com>,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <20261112220218.1adae5e5@pumpkin>
In-Reply-To: <20261112020439.37b0da70@jic23-hlaptop>
References: <20261111072608.3490763-1-diwux@google.com>
	<avR-KT-6e77EexZn@ashevche-desk.local>
	<20261112020439.37b0da70@jic23-hlaptop>
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

On Thu, 12 Nov 2026 02:04:39 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Wed, 11 Nov 2026 16:39:37 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Wed, Nov 11, 2026 at 07:26:08AM +0000, Di Wu wrote:  
> > > Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> > > and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> > > PAGE_SIZE limit and is the preferred helper for show callbacks.    
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > 
> > ...
> >   
> > > -	return sprintf(buf, "%d.%06u\n",
> > > -		       latency / 1000,
> > > -		       (latency % 1000) * 1000);
> > > +	return sysfs_emit(buf, "%d.%06u\n",
> > > +			  latency / 1000,
> > > +			  (latency % 1000) * 1000);    
> > 
> > As David said, since you touched these lines, make the less amount of them
> > while at it.
> > 
> > (But no need to resend, usually Jonathan is kind to tweak this small thing.)
> >   
> Done and applied.
> 
> 

I just looked at that line again.
Why is it multiplying the remainder by 1000?
It could be:
	return sysfs_emit(buf, "%d.%03u000\n", latency / 1000, latency % 1000);
if the 6 digits after the decimal point are required.

David

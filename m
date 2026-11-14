Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794659514;
	b=YTYb70EbPgbIpXD5jERg+r/UuqXCXgP+Ghyy+c9TntKQGiN0AhC8mNuifISdrSoChcSH
	 Yz3PJCVIYjotF1u4cgr7D8OOH+wf7uOWVjcpzaXFh6Q5flAn0YB2ND3PwKXGulsT2LNey
	 gQozA0B7P2P7Pbpd7gLtOqwmPOw+GQagWAKPzLKMMZdeHmdEhM5q/WXlKqefZgYNmAEaO
	 dRAtnt4FiFsd/CfOEe82P9bVPBWVSfzHQkID7cV7h02yaPuRm2zzw89xaKnXN6emzJMIK
	 FzaGx/xwdmad3UXbeEUZWgVVG7nGFXa31ZQHXxTy+NKBEoe7wvqHfiZcRenVmYBPxDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794659514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FubQ7kDfuCTVnbQ3HELJBh3vpsV3nUuIUT4l+VZplWI=;
	b=hQ82roCo1Aogshk1KtTPiiKOUl6YiILbKftarXJbqyo2q/bLPowPIwI382Zm6A22GGDf
	 Es2CDjqjXYYabWIT3s6315/nlNR1H0vxAMtsO/C+dg0kZ1M3mA2BXJjQo8Lk8CLRTR9fA
	 qVJcgCtURRQXCVZ9jy0ozWj++GOz0VFmlOEhtvByVoL+v6gfzGEGYxOp17cVfX098pfOM
	 nRjKNfzEhAa1X+Qd9o1nX3PBqoNw0gpnFLK02CJ9NEo18ERoS4QrCDYPDRwxc6RDIGpZN
	 3xES6EgyCERUwfyxqfNwb4YHLrQijJ3y3X5mFeT+Y27OJY53QZGRTEXB0ttL+2WDKRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOJxfhsV;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B0606A32D
	for <chrome-platform@lists.linux.dev>; Sat, 14 Nov 2026 12:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452B0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOJxfhsV
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so23041905e9.2
        for <chrome-platform@lists.linux.dev>; Sat, 14 Nov 2026 04:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794659512; x=1795264312; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FubQ7kDfuCTVnbQ3HELJBh3vpsV3nUuIUT4l+VZplWI=;
        b=zOJxfhsVHDBvTbukgHY3+97Lz9sCvIOcrQTrw3qn0jXA9BLhtoMS4HP+Qn4nYKoPj5
         Y4ZGRjfoK1giCH+YN8YY+TZI+Qzvj4CIVvgZlMtbLURvRX5iTx4lHma40P/fSxGlM2gB
         s6RmYVp3WdRrXZ7BP4TmQusAS7nfL7As0zhzYftEyK8IgSHCTzBRBbGXDOjhv3lgOB+n
         jcb/qK6tBlx/eWL7wpfYjim8AZ68vcMxo8Ix/vNrxU6rYMCVW2JadsN6ELrpuQaMiawY
         eWPzD3B3mfOls8xY4PT0BoXlCYrVmTssF9ef6IpbYBfB/cvnAlq+Cusy7EL6h+SrhQxr
         fTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794659512; x=1795264312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FubQ7kDfuCTVnbQ3HELJBh3vpsV3nUuIUT4l+VZplWI=;
        b=bd84agDQrbWh0W59wsrgXlCXD9ZKgu/JlcdNhVER2mLWjXWCW2bhYIg/C4HePkLcaA
         pOBrGQv1a9L73XdwIhW2ncVdPxWdej/8F3oP8ywf9Ohga2Gkq/4aYIEHOGkDrkWWqVL6
         JYMWR39/L40WS8Rp3xXeCmivbZ2Z4Z3YFbwVdyOYOOLxR1jMFR1fMJpkzaG2j2XUt3BT
         kn/YxVLmyZL1cTMs9EpyBQGIG7g2JqN2wwb7pdpPZ+Yu+mbO/aQbat3hSZLG1iH16oxC
         8EN9AAqHUdjCs28n/F0VLCTzW0rxHaoun2P4QkWsi5DGgHRYL/cNPkfUFQOLpbIdEO1i
         gwdA==
X-Forwarded-Encrypted: i=1; AL+hErFg3aimz+8u3v/0mygHq6UUrEsSiC1u6YUqhDXtu0MwM0W3REzAXcLiEjy11D6KyGcUXvRQiHg+pqs+C6s+lcU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8iz9XGEZI5iSHqA9fVjrve2Jm+3I71idWn6fxPlw54phY/XBJZ
	Sou00fImf7M9YoVrkYlznit9HeNhQ30MQNmEgojjWH3tALDUxZjgQQhc
X-Gm-Gg: AYBFou1lHBgbbV87QM+6PIRBthMwawzrwjthA/bPeFTFahN5pEJjMHSCP61N9tuv8XW
	46Ly+QFKr+eQP8uMQg+MeBH6YwigScCmkoJi2AdCkYRGJSM3BaqIOQZM0ywjETbUsFH1+HgHYQo
	V1FtIbg1c2cTaqEoo/IpJ39LAIdfXcmWbQa0eki4KWr/JgBcT9sYtdLYmm+agWxuzsmOCNCGA2+
	/abqYNylwbU2OgYN+Gg+hH2TqFkhuzTN2cwB/MXzX9nypPMUHWiKi1Qc18LVsrix37LcyYTxq2q
	yvdaz9Bu3GxyRNQsNfG/0s/Wd+wyWG0sdvcagPD+ybda6gTGM3Ycgy06E3Pvm0GwWl60QmBwHQs
	pvglUrkuDkYl1OF32SC3TfgHr5+J9CzGzJo1Z96ynGyj2YpZxCVFL22r5pHyNQzH2Is73PPfGwB
	YRVVWNeUxVxcMt9WqDGIH8TN2yt8U2I6P7Ui90j4aBp5qYTPBkGrG1oAQ4rY6NEd+WTaKBxYqus
	72qQYjdDredRLYTXVo/KtrjtGd8dd7ivfJn0dXSbuAtMBFcUzBs1dm+OlBpmIPLEtwts3VWjzUL
	FuYehomYUMhvVa0vKFIjFNlPmag4xD84B0cVZkKBiKgG06fx+r6b6rrX32TUJEA0Kg==
X-Received: by 2002:a05:600c:3110:b0:4bb:5df4:685b with SMTP id 5b1f17b1804b1-4bb5df46970mr75245315e9.23.1794659511598;
        Sat, 14 Nov 2026 04:31:51 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm186313145e9.7.2026.11.14.04.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:31:51 -0800 (PST)
Date: Sat, 14 Nov 2026 12:31:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Di Wu <diwux@google.com>,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 bleung@chromium.org, groeck@chromium.org, tzungbi@kernel.org,
 linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <20261114123150.7eff74ea@pumpkin>
In-Reply-To: <20261114021554.2165a2bf@jic23-hlaptop>
References: <20261111072608.3490763-1-diwux@google.com>
	<avR-KT-6e77EexZn@ashevche-desk.local>
	<20261112020439.37b0da70@jic23-hlaptop>
	<20261112220218.1adae5e5@pumpkin>
	<20261113013646.4c2f8456@jic23-hlaptop>
	<20261113092305.00ec8be5@pumpkin>
	<20261114021554.2165a2bf@jic23-hlaptop>
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

On Sat, 14 Nov 2026 02:15:54 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 13 Nov 2026 09:23:05 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Fri, 13 Nov 2026 01:36:46 +0000
> > Jonathan Cameron <jic23@kernel.org> wrote:
> >   
> > > On Thu, 12 Nov 2026 22:02:18 +0000
> > > David Laight <david.laight.linux@gmail.com> wrote:
> > >     
> > > > On Thu, 12 Nov 2026 02:04:39 +0000
> > > > Jonathan Cameron <jic23@kernel.org> wrote:
> > > >       
> > > > > On Wed, 11 Nov 2026 16:39:37 +0200
> > > > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > > > >         
> > > > > > On Wed, Nov 11, 2026 at 07:26:08AM +0000, Di Wu wrote:          
> > > > > > > Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> > > > > > > and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> > > > > > > PAGE_SIZE limit and is the preferred helper for show callbacks.            
> > > > > > 
> > > > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > > > > 
> > > > > > ...
> > > > > >           
> > > > > > > -	return sprintf(buf, "%d.%06u\n",
> > > > > > > -		       latency / 1000,
> > > > > > > -		       (latency % 1000) * 1000);
> > > > > > > +	return sysfs_emit(buf, "%d.%06u\n",
> > > > > > > +			  latency / 1000,
> > > > > > > +			  (latency % 1000) * 1000);            
> > > > > > 
> > > > > > As David said, since you touched these lines, make the less amount of them
> > > > > > while at it.
> > > > > > 
> > > > > > (But no need to resend, usually Jonathan is kind to tweak this small thing.)
> > > > > >           
> > > > > Done and applied.
> > > > > 
> > > > >         
> > > > 
> > > > I just looked at that line again.
> > > > Why is it multiplying the remainder by 1000?
> > > > It could be:
> > > > 	return sysfs_emit(buf, "%d.%03u000\n", latency / 1000, latency % 1000);
> > > > if the 6 digits after the decimal point are required.      
> > > 
> > > Good point, I guess unrelated change that we could have on top.    
> > 
> > Indeed.
> >   
> > > Those trailing zeros shouldn't matter.    
> > 
> > There is a matching oddity in the set function (just above).
> > It calls iio_str_to_fixpoint(buf, 1000000, &integer, &fract)
> > then does latency = integer * 1000 + fract/1000.
> > Just replace the 100000 by 1000 and you don't need the divide.
> > 
> > iio_str_to_fixpoint() will ignore are extra fractional digits.
> > 
> > Although I'm not at all sure its handling of negative value is correct.
> > It converts -1.5 to -1/5 and -0.5 to 0/-5.
> > I can't see how that is useful since i*10+f for both gives -5.
> > 
> > I'd have though that either the fractional part should always be positive
> > so -1.4 would need converting to -2/6 or it would have the same sign as
> > the integer part and -1.4 would be converted to -1/-4.  
> 
> That is rather odd use of the output of iio_str_to_fixpoint()
> which admittedly is a bit unusual because of the need to handle there
> being no where to put that negative when the integer is 0.
> 
> Can get away with it here though as latencies aren't negative so.
> The code doesn't seem to actually check that though which might
> be a nice useability improvement rather than setting it to something odd.

I did wonder if it is ever used for negative values.

I'd have thought that fixed point maths would always want a positive fraction,
so needs (eg) val/1000 and val%1000 to truncate to -infinity whereas C divides
truncate towards zero.

It is possible that the function should just convert 1.234 to 1234
and 1.2 to 1200 (assuming 1000 for the input parameter).

Clearly not really relevant here - apart from not erroring negatives.

David

> 
> Jonathan
> 
> 
> 
> 
> 
> > 
> > David
> >   
> > >     
> > > > 
> > > > David      
> > >     
> >   
> 


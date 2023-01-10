Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EDC17E5
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 05:16:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id az7so10522954wrb.5
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 21:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3PxMRylU7VW/C2nNeF7Y9SkTmJMkb35RgT3nz6TLaHo=;
        b=YzJhbcvxafLF0RAWvTSY5hNb/JMhOQH4NLEaV8H12TNi4ApM3icbJFpMFpUvpOQPDv
         aegwxm9kGKJCyUOQZNWMvDEBqAJppxWkkiHjV+4Hj82vfFZYw5tVBlasHwLc1ijpRXc2
         U4Sbqh3/xjYOT+6t+XWn2UqK/qGd4btHKEoZrfFndFp6UgPadiZ6d9nMsbFH28YtCftB
         c9+nvYTImx964mp6FS+27fg8SUyztuWtpzI0v82d7drzS3wNjcV0kVO9EZcXtgHb06cn
         B/ylafr3UUz46ljJHC01Qn8f0EKXgVESL/+kSeal5NrDRHfCLwfJeriENzuVs8D6jrZh
         9XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PxMRylU7VW/C2nNeF7Y9SkTmJMkb35RgT3nz6TLaHo=;
        b=CW+3H9nWTBYQUaM5cimn1crVMiiW20ZlAxPBK/B2wvCyazaI1EfuPYdPA2Qu/3V8+c
         0gFjrRz87DJD3lWpn6+dbgaYTWMkNHyuYOqlhm4XoMDKNNbNMFa/5IFF1gCtmPlU/nfS
         Z2BBXySm4YHOyL+sOb39Ofs1dwV0Dd46aT4v8LGCjjR+FPRMjEQ1tCEpl2Dvv7riXbAs
         Jxk2L7/SjmMrMwa/ZCFfC11A4tEKmF+t/1TuZz2kaeeOaXG5I85RkMY4ShxDxhK4xCHu
         /Pd4uNnfLmZlfjz9d39/m0dsJSoHLse5KmFhHNT3z7mOorWfJbZCpEPEcm4P9FP9vtBY
         fsJQ==
X-Gm-Message-State: AFqh2kr0JaT25Qt3nY/dmJ5fpUwa5AFdq6DMpNqazUHGikJCteOlL5OE
	0kTEy7vRZ/MQc7Lj6G2KBTaLowQj3Ec=
X-Google-Smtp-Source: AMrXdXtxJDu625xu6XMLqkrnCh6bdxa9hYyikgPb8bilD1DVeGrLYX5Furs1lbUcuF8UjgQXjrRxtw==
X-Received: by 2002:a5d:640c:0:b0:29f:7c0c:5a46 with SMTP id z12-20020a5d640c000000b0029f7c0c5a46mr16474977wru.68.1673327811010;
        Mon, 09 Jan 2023 21:16:51 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t14-20020adfeb8e000000b002baa780f0fasm9992594wrn.111.2023.01.09.21.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 21:16:50 -0800 (PST)
Date: Tue, 10 Jan 2023 08:16:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bhanumaiya@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [bug report] platform/chrome: cros_ec_uart: Add transport layer
Message-ID: <Y7z0wGhf1AuJ9XKl@kadam>
References: <Y7fhw4S7Tb0GcHMF@kili>
 <Y7zapHKnXRbK2c5v@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7zapHKnXRbK2c5v@google.com>

On Tue, Jan 10, 2023 at 11:25:24AM +0800, Tzung-Bi Shih wrote:
> >     175         if (host_response->data_len > ec_msg->insize) {
> >     176                 dev_err(ec_dev->dev, "Resp too long (%d bytes, expected %d)\n",
> >     177                         host_response->data_len, ec_msg->insize);
> >     178                 ret = -ENOSPC;
> > 
> > 
> > ret = -EINVAL;  (Unless you are discussing harddrives).
> 
> It looks like platform/chrome used the error number for a while for the
> case:
> 
> $ grep -R ENOSPC drivers/platform/chrome/
> drivers/platform/chrome/cros_ec_lpc.c:          ret = -ENOSPC;
> drivers/platform/chrome/cros_ec_i2c.c:          ret = -ENOSPC;
> drivers/platform/chrome/cros_ec_uart.c:         ret = -ENOSPC;
> drivers/platform/chrome/cros_ec_ishtp.c:                return -ENOSPC;
> drivers/platform/chrome/cros_ec_spi.c:          ret = -ENOSPC;
> 
> I wouldn't feel bother if we keep using the error number.  Otherwise, we
> should change all of them.

I don't really care about this code, but generally don't let consistency
hold you back from being correct.  If 99 are wrong and 1 is correct
that's at least better than 100 wrong and none correct.

regards,
dan carpenter


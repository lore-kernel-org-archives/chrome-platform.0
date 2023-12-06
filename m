Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306D22D7AF
	for <chrome-platform@lists.linux.dev>; Wed,  6 Dec 2023 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XuHaHwcZ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3333224c7b9so566467f8f.1
        for <chrome-platform@lists.linux.dev>; Wed, 06 Dec 2023 02:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701858858; x=1702463658; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkqurgaRmjaLu2pCU3OGXo3U4UmjRqbubj+U5Qx3nMc=;
        b=XuHaHwcZMyOrAX0n8qnko+chnhja/batpUu0A0sjcYBp6JGjqDkv5gMfmK0p8G12mf
         aY+1kJADYWmV+9i0G5dq6nkPGiZgUHsuCR+FNvn9cqQ0tcGHhh9ka+csfpLSF5YjwJWu
         7ZrsG2IJThJ1rp+AcicGX6A+mTRNMPvUa5JmY+2Kz3R6dWQpqxCM7ggHeXsyVPL2h3l9
         Q0nqGXHu3Ype7+WPI0B/b3nbRFWDV8Jhj0OqG23+etOu7bouKpk35vQ/iEhUSM6nWg/2
         O+6bl+B4be+RdIVplvWtuKIH83q2xWwyNByuXtcWS5zY6wX0WdFWivPHIGOv0nFVE4Jr
         Uxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858858; x=1702463658;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkqurgaRmjaLu2pCU3OGXo3U4UmjRqbubj+U5Qx3nMc=;
        b=dCxZTakZkyF0tMSbcgYddr+RMWjqoZ75aSBcBZPFkjMINx9Mmq5HxfxQD/w9Pc6+px
         /TTCXUlAbhYWpALUgGEWM/ZY7JU6dCkdc2aDZqZeixx2OoPcKQuOnkjzzC5+Lh1WqKeW
         ERoqcAsSyVOM5t7GB54LBuoAH14/lXPiyA/X+scDXCAbuw86V/zciXuVdruiHwfu1N54
         wRSFEmzhQ93qJlM97dMiEiq6oluLcSsSvG0SmQyRDZGcD/PPxuuARq1+kLMpcPEMKbTX
         oXzZ7P0wRUOZtcfoZdi1ZMb3rHCcimrBYlNCjhcvfsgndrB4G8Z+/zhOKBJIv+Taxs4v
         UumQ==
X-Gm-Message-State: AOJu0YwylFJjAqlfbKU1XGi1KM4cd+z8r3AVpmklcRtRqVi+2xDPr5Rl
	VMoGwlN/b+qQdk4bSgnkbZsS++uJpxpUdg0YmGigAA==
X-Google-Smtp-Source: AGHT+IGydOHhQc8hj4pdsRCVfI7xupjllVV2cYAvnk9xvpQfdj1pdTOPuyTtnGm+kybSdb3zkcH1Dg==
X-Received: by 2002:adf:e502:0:b0:333:48d7:f56 with SMTP id j2-20020adfe502000000b0033348d70f56mr346921wrm.49.1701858858376;
        Wed, 06 Dec 2023 02:34:18 -0800 (PST)
Received: from localhost ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id q3-20020adff783000000b003332febec90sm14589786wrp.7.2023.12.06.02.34.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:34:18 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 6 Dec 2023 11:34:18 +0100 (CET)
To: Tzung-Bi Shih <tzungbi@kernel.org>
cc: Even Xu <even.xu@intel.com>, srinivas.pandruvada@linux.intel.com, 
    bleung@chromium.org, groeck@chromium.org, linux-input@vger.kernel.org, 
    chrome-platform@lists.linux.dev
Subject: Re: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper functions
 for connection
In-Reply-To: <ZW_rdCJ7EdtmJYFz@google.com>
Message-ID: <nycvar.YFH.7.76.2312061133470.29220@cbobk.fhfr.pm>
References: <1701741033-26222-1-git-send-email-even.xu@intel.com> <1701741033-26222-5-git-send-email-even.xu@intel.com> <ZW_rdCJ7EdtmJYFz@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Dec 2023, Tzung-Bi Shih wrote:

> On Tue, Dec 05, 2023 at 09:50:33AM +0800, Even Xu wrote:
> > Use helper functions ishtp_cl_establish_connection() and
> > ishtp_cl_destroy_connection() to establish and destroy connection
> > respectively. These functions are used during initialization, reset and
> > deinitialization flows.
> > 
> > No functional changes are expected.
> > 
> > Signed-off-by: Even Xu <even.xu@intel.com>
> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> 
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks.

> One minor suggestion: we usually use "platform/chrome:" instead of
> "platform: chrome:" for the title prefix.

I have changed that, and am taking it together with the rest of the series 
through hid.git#for-6.8/intel-ish.

-- 
Jiri Kosina
SUSE Labs


Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6941844
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:11:44 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso5300295pjt.4
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PsQRJos1x7+gzTmfGxoBBhgjdDt8Hj3LByN10gLeeQY=;
        b=ZJx3gg8GGDueeZSZE8cCgxVSVBJMTDTqqA/WrNlyM7DcREsGAo2sYQowhnIUNXDLvI
         b5mM5uNgp+MfS7eJyXq+fCGi8yXpel8HrxuGc+LLC51PbVFbR5mEPqhYZI4QPVwXYmfI
         zkwmjBh9rNG7MuHbD0epjqGc2EnnyZZ7EJX6P7w+SXUJdxeOea6/uFdwM2jNSohdTwYF
         KrJb2nDjnK6i1Dw+g6kCMJO4om64bBegovr1T2SRwQoBxOTD+pc4itWzilX3vhuC7Rko
         rV/kycK/VVQN0BpdvDVSx+kSF4LYNFxqp2ziWpPKLqH7/yoTdBXtDxwjqkcujwqfH32j
         AOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PsQRJos1x7+gzTmfGxoBBhgjdDt8Hj3LByN10gLeeQY=;
        b=z+U8MXcaATKMPZwt83GP8pSgrf7KiiZBbYTUGKMtcL/nj82ps3uv2xdgu5cupwnFHG
         WHscpQjgYd4cQOcWjBDpZFBzRBFarWnP7htZWTYVfxf2ViWvf5DUtNYgn1a5BD5a5Uff
         Len8s+T7jaLOk2QEPs6YZ0xrEjzukD2/V6S9QhPVW+yL602GytJRNMH0Ik3/ayljz0jT
         AZgB5LcDAGppNzY9/d0DImUx4ngRP2BB/1VyU/6bcFnd+vMNgLEW31+a5iNKdhTTatnw
         azKgNyc0P2gPO2mMYPG0XCXZSDKvSwFpNlVppRuI7KdywltsGR+wB0E1jtL5d4Pgl81a
         Xs8g==
X-Gm-Message-State: AOAM530W95SN4SNpt0cdzPVVw+Avx+MJYGtnSx8GQaIOX0UGwEVci627
	Mv8crkrGk3X9xkvMn+25wKbEUg==
X-Google-Smtp-Source: ABdhPJxwGMtIpk7Cz5bd4WKUQIgsdGQJD5hrfiuorZaXn4bh0kVIfqthGFtet4ErAxF0GSkdMSxU1A==
X-Received: by 2002:a17:902:e74b:b0:14d:ce80:a9c5 with SMTP id p11-20020a170902e74b00b0014dce80a9c5mr997640plf.157.1644984703325;
        Tue, 15 Feb 2022 20:11:43 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
        by smtp.gmail.com with ESMTPSA id k16sm42411502pfu.140.2022.02.15.20.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 20:11:42 -0800 (PST)
Date: Wed, 16 Feb 2022 12:11:40 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 1/6] platform/chrome: cros_ec: fix error handling in
 cros_ec_register()
Message-ID: <Ygx5fAZ6gMCxeatA@google.com>
References: <20220209095703.517608-1-tzungbi@google.com>
 <20220209095703.517608-2-tzungbi@google.com>
 <CACeCKadu0f04Mip8R1OgucfN5GvU9RBEbgq6RQZiVWAePxZChA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadu0f04Mip8R1OgucfN5GvU9RBEbgq6RQZiVWAePxZChA@mail.gmail.com>

On Tue, Feb 15, 2022 at 01:39:51PM -0800, Prashant Malani wrote:
> On Feb 09 17:56, Tzung-Bi Shih wrote:
> > +exit:
> > +     if (ec_dev->max_passthru)
> 
> This just complicates things, by depending on another variable. Just initialize
> ec_dev->pd and ec_dev->ec to NULL at the beginning instead.

Ack, will fix in the next version.

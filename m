Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549ED1B69
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:12:07 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id f8so1038387pgc.8
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hMbfh+ar2SKhUHGugtPSgbBb8nVru9HHc/UKsNOYLZs=;
        b=p8u1wbyYX8dKPtoUnRty5/wEz3b15X9frDd98uCyKkQulCxYCoCmGex1W7cd8DNBVt
         2CVWyb/5e2eyRw0FVWXDZZuGEBxnLFQmv/zGuL6Y/XUYlYeSjXD5EsQz21qhAIpgRiJB
         cjBPdAYXswopS0XM0R84nc+kQASeH6MfZ+XwEReqyUiUkggSLVa+zuNQW7vkxOcswJZf
         mUT3lJYjhKzEb+fJAK2xTuHf2DM3QHs9ITIS1xRN0tj/9RAtsUPsyKFbTglhMv+bJjEG
         Z0v5x3az4s5B93V2ExpVp5jUTBxjcA7wWt/pq2pL5No/mgOrpTjcOPF7aFkK5rLng3a1
         l+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hMbfh+ar2SKhUHGugtPSgbBb8nVru9HHc/UKsNOYLZs=;
        b=4FB2seMSgso0D+Oz1hE1xDhzzA5WYNpZlh33VAR1dO3qqGD8w4njQaJDyqyhLTMpWL
         +5R3r3h4/NolQsUNIYmMKW8KaMk4lN6IPu1bwfcRLg04tPLmDJskpRR50B9dSXE/0v3D
         m6V3wH0rpNjui2cYgGaY7KfNwK3vqfaYFkyHD5xQ9akJlGtgMTXCz4IPSzBVUUwTjVMD
         JR0CqUTJkc6uclBvUSfLh7JxWeWMFBdxb6SUVv8zlis9mpvLDUKD/im7QPppO9OQ7Oeo
         xRPPYNvKUZG5j0/ZNoI8hd7swcRTCZK0p7XoRQ5EzRkQM7yTCPlykdUkkzlvV32C7EI7
         ntww==
X-Gm-Message-State: AOAM531RdLipey+lZrNFbQ/7XD305sa9JB38ny5xJS73w1kP9OAJq9Gw
	DfjtNJKziUS37jT0Sbo32uKX/w==
X-Google-Smtp-Source: ABdhPJwSefUf0UKlExttaCF0Cf6aHygLnKERGrvfJIFni4b676B6af5SpSiMD7AEuKcH2vzrg78CMA==
X-Received: by 2002:a63:7f57:0:b0:34d:f721:7fef with SMTP id p23-20020a637f57000000b0034df7217fefmr771520pgn.476.1644984726643;
        Tue, 15 Feb 2022 20:12:06 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
        by smtp.gmail.com with ESMTPSA id o5sm40845551pfk.172.2022.02.15.20.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 20:12:06 -0800 (PST)
Date: Wed, 16 Feb 2022 12:12:03 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 4/6] platform/chrome: cros_ec: don't initialize `err`
 in cros_ec_register()
Message-ID: <Ygx5kzRlwlNfn13e@google.com>
References: <20220209095703.517608-1-tzungbi@google.com>
 <20220209095703.517608-5-tzungbi@google.com>
 <CACeCKaf3uNOtr9BUONqs7W5QCYha-3MzZGX196UtYsBdezODwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKaf3uNOtr9BUONqs7W5QCYha-3MzZGX196UtYsBdezODwA@mail.gmail.com>

On Tue, Feb 15, 2022 at 01:39:57PM -0800, Prashant Malani wrote:
> On Feb 09 17:57, Tzung-Bi Shih wrote:
> > `err` in cros_ec_register() doesn't need to be initialized because it is going
> > to be overridden in the following code soon.
> 
> As mentioned in the previous version [1], please drop this patch, since
> it is not necessary (doesn't meaningfully improve readability, doesn't
> fix any bugs).
> 
> [1] https://lore.kernel.org/chrome-platform/CACeCKaeRz2D-DdPRHbrvywTMr2w-MPuGZ+-mBhNtWCapgm=ZXw@mail.gmail.com/

Ack, will drop it in the next version.

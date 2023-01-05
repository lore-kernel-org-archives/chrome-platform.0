Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0E47FD
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 04:40:41 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-4a2f8ad29d5so162952607b3.8
        for <chrome-platform@lists.linux.dev>; Wed, 04 Jan 2023 20:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L3RKDUpLHSH4OD7mBSrVtKOYMv8CoVoHckaHZEsIkq4=;
        b=RQIVRGo/f16meY9QNhwDHd5XV7H+7Q0kl6ORpJs2ivxGA7VlKL9MUklTWB6DRLKkXs
         WPzOx0IXj3aKuIyb02gGvX+mLXzpbmUaU2MVjnZEMBBpqRKLU9C2AF79GJoXOxfC9Cgl
         C8+5FjbkK661w2xwzzmQ4ryrepXFv2iiB0eDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3RKDUpLHSH4OD7mBSrVtKOYMv8CoVoHckaHZEsIkq4=;
        b=eUZLSXw3nFFjsqkO4HmgrOYLKzI4AAsHxewb8LyzTpwRKszQPrR2/XiBRgcVo8pRjn
         5WA7Dz/usCQUz/Sa84z69+j5tg5AsqOtz0b9RYGtXiWq/6P0FzkIWBA/l/H8wGPDBRR2
         CvT+8MA3Ke/6FNglbFnFfi4xL8vM4H7/+sNoGvVhLb4fsR2qi0o0WZ6LtvcMZVw2p1ik
         MrebC+2XaWUowWLOkCgzEh6utuZVa4ShWhm+Gfch01VqBcmc3+kshBue1GigVWmgbXY7
         j0mqT+mo/FMmmFVhoyAONMtwgMOG0cBa3TZBFiWWjARb2aUfry7jX53a79Vh0V7t2Zl5
         g72Q==
X-Gm-Message-State: AFqh2kp+bz0S7/m3CD3kfuqLrfFF1v8ZB5cGO2IkXQMqeHsYn5HnUzPU
	sSReORsUUdz//8NqlUjeTABuoQiAm7HCPxY62Q3fTQ==
X-Google-Smtp-Source: AMrXdXuVE8jGRrwpzSJm50GAFPDPk2bw9DQY1t+35libp4KRqkIN4hZjSpcDlB+30nyy4CFNbmyjNEg/4CYw0MfHtJM=
X-Received: by 2002:a05:690c:589:b0:4b4:f4a7:3ac5 with SMTP id
 bo9-20020a05690c058900b004b4f4a73ac5mr685186ywb.187.1672893640435; Wed, 04
 Jan 2023 20:40:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230104011524.369764-1-robbarnes@google.com> <20230104011524.369764-2-robbarnes@google.com>
In-Reply-To: <20230104011524.369764-2-robbarnes@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 4 Jan 2023 20:40:28 -0800
Message-ID: <CACeCKaeS=q2PMtLPivqVLAUNho99KOkD7qsrxorXd8LPRerY8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] platform/chrome: cros_ec: Poll EC log on EC panic
To: Rob Barnes <robbarnes@google.com>
Cc: groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 5:15 PM Rob Barnes <robbarnes@google.com> wrote:
>
> Add handler for CrOS EC panic events. When a panic is reported,
> immediately poll for EC log.
>
> This should result in the log leading to the EC panic being
> preserved.
>
> ACPI_NOTIFY_CROS_EC_PANIC is defined in coreboot at
> https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/ec/google/chromeec/acpi/ec.asl
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>
FWIW:
Reviewed-by: Prashant Malani <pmalani@chromium.org>

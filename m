Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8B2F23
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 03:32:11 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id e28so1972282pfj.5
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 19:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U3YWRJiOX6r2DiP9iWkoebtSk7wb9LQgDyPaYKJpHzg=;
        b=nXjf/f5LQhRawIBVlV+uE2HRNSdBDqb1TVkY42Ucyl1AFQmJYizT78Mo0V0i+FRlJX
         rkXkKyZSaZlcW4b7o4vnjdFAzIGsQGWZtTQ7/n2MDm3LOZgspH4jaup9YKX7Wx3zDbR3
         juZ78ajOOZPzoQDNqX6MLmJvQWkpMBlyfbem9XPtvyItr240K06KEWR9y9RDRFM9UwDD
         /e8srRI7OVqLv/UhiVxWE+OcLqZ8CcEnoPei08wnD8RIWMa3AOL1Zqhoer3LI2XKwnZL
         AAYXEaEfFaasSmXgNlKy3+Lj+QEo70qkWiARvzdtca4LrlUlK247CO0X+6C1oTXh2ih3
         Qa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U3YWRJiOX6r2DiP9iWkoebtSk7wb9LQgDyPaYKJpHzg=;
        b=H8IIUS7KOQF9/t8Lwv1WaqLAb6hZb/rvr/4LAYQ86jWFzwcP7Ma/xuKfvzSHbLLXB1
         pKsN/oFWd5Zn+xgcD3YmcOhk2IhV28bZ76fZ1MNzLXAKCaUC506SZfMCcFzMIxyFDM5s
         yMPxSAtnAQurb+TR24j8xtEcHQ6olI+wFnPghkgSKrcstprXR0Q5nCJRKX/EUkV5wdFT
         /UV5SRxIdS814JfNQX5GKC8k/2oxxi3rXhPrWCOIW95gD3YpL1ioSzHQlLI/1JSI9WHl
         aZQxQp5Xv7BQLGTxaET3hVkjMIF5ANjNfdXMFY6cedkSOeoc7JWDu3NWrsYbLSaUm8La
         8Gvg==
X-Gm-Message-State: AOAM530/3779elg5P7yhGfRKLVq1kJck6GOpd3m/KXxPHKiyqNU1qBQW
	SH8HmUYROR2d8drYhvsWRpPUSHQc7Mm7JA==
X-Google-Smtp-Source: ABdhPJy7m6DpHFgJiKhMcyEac2ifKifQfKmXJnjw5v0c9O67wVpVHjnzSDcZixIVJaVAmGOKe1cPxw==
X-Received: by 2002:a63:2c92:: with SMTP id s140mr372406pgs.448.1644377530580;
        Tue, 08 Feb 2022 19:32:10 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id y15sm17012526pfi.87.2022.02.08.19.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 19:32:10 -0800 (PST)
Date: Wed, 9 Feb 2022 11:32:07 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v2 1/4] platform/chrome: cros_ec_typec: Move mux flag
 checks
Message-ID: <YgM1t3aJPwMbhEQt@google.com>
References: <20220208184721.1697194-1-pmalani@chromium.org>
 <20220208184721.1697194-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208184721.1697194-2-pmalani@chromium.org>

On Tue, Feb 08, 2022 at 06:47:18PM +0000, Prashant Malani wrote:
> Move mux and role flag checks inside of cros_typec_configure_mux(),
> which is a more logical location for them.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

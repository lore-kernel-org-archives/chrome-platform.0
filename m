Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DFC28F9
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 10:10:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y41so4335020pfw.12
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 03:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2IFiYfoIKlICTpTGvMOw6q9N3Q3vW+HIY5wMaOVljZc=;
        b=ZS9+8YiztFlMOzLkLRbd3S2QaIvchP0IYmkI4QwtS2UX5aWkOX3kW9v5luy05CeE5U
         m3Ns2rDEhxjuZj3AvCADV2PrDTS6u+zwRWkrdt4JoAAa1cIgRXTigPM9QSo48OnMdl0p
         0N7VeiYFaOecenJjLxTl/Ai1cXGHxgfRhsvEHWREOlLCGAfMNL/g2FDT6TWF8r9VA1bi
         2t9jjCvrYDZAckvV10bZhoYKhtEmh60T43DFvxQOdOddYLSfAZ2XBBMGnxzw6r//x2/1
         RyuiMg6Vz1/MQ0jh7fKfvAuIhp1RnaHUHAxn6e22FzGfwp1tAMGKEcRU5+VrzHCErJbg
         mINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2IFiYfoIKlICTpTGvMOw6q9N3Q3vW+HIY5wMaOVljZc=;
        b=FOcn41sjDqjmHEwSz1U1fS+ZUfOtMFMJHZirNYGiQz8kT6Q/esG6XSS7HP21LVvwM3
         2rM1LsNIIp7Vn0A0GuycwZiSkRFl3p+HJNVR7kxDTIC1SwNAb4MCrCPDSGW5sdMD881C
         gSCvyskPpLOlycWw/UeIACajjKRIER23nwSg17o6VesC3cQgTF/VsTvTm1spgyAwL10i
         ojt4AUO0Shs65OpVzPGgI9bhx8HTeutpbD6qWZbhUjPGjECyZuNdLVN7YCItwa3A6uqi
         ihxl4ilAByg5HMRonUhvWpgB8CRKjfXyI6vnxrXMyjyGN36wIYeuvlDpNms7wucjqFUN
         paxA==
X-Gm-Message-State: AOAM532UkeT6Sk3FMO7YZOzCZedhK/rCUNFKMzJe0aHENe1NOLJLEC3A
	EuLRfW56E7pXlfdardDJfYw=
X-Google-Smtp-Source: ABdhPJzDknA/eDpL7RTHehedtaKh6jrwFijU1Kxudu0qoCCpM9PmOpPk0MgEfMNQSrtTeIYg8P84dA==
X-Received: by 2002:a62:61c6:0:b0:4bd:118:8071 with SMTP id v189-20020a6261c6000000b004bd01188071mr10719694pfb.28.1652350224466;
        Thu, 12 May 2022 03:10:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:ad76:8fc:e2ba:172])
        by smtp.gmail.com with ESMTPSA id u1-20020a626001000000b0050dc76281aesm3336599pfb.136.2022.05.12.03.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:10:23 -0700 (PDT)
Date: Thu, 12 May 2022 03:10:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org,
	dtor@chromium.org, gwendal@chromium.org, vbendeb@chromium.org,
	andy@infradead.org, Ayman Bagabas <ayman.bagabas@gmail.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>,
	Darren Hart <dvhart@infradead.org>,
	Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v12] platform/chrome: Add ChromeOS ACPI device driver
Message-ID: <YnzdDMPR3qZ1waJW@google.com>
References: <YnycZaoBPF89t/qF@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnycZaoBPF89t/qF@debian-BULLSEYE-live-builder-AMD64>

Hi Muhammad,

On Thu, May 12, 2022 at 10:34:29AM +0500, Muhammad Usama Anjum wrote:
> +static int chromeos_acpi_device_probe(struct platform_device *pdev)
> +{
> +	chromeos_acpi_gpio_groups = get_gpio_pkg_num(&pdev->dev);
> +
> +	/*
> +	 * If the platform has more GPIO attribute groups than the number of
> +	 * groups this driver supports, give out a warning message.
> +	 */
> +	if (chromeos_acpi_gpio_groups > ARRAY_SIZE(chromeos_acpi_all_groups) - 2)
> +		dev_warn(&pdev->dev, "Only %zu GPIO attr groups supported by the driver out of total %u.\n",
> +			 ARRAY_SIZE(chromeos_acpi_all_groups) - 2, chromeos_acpi_gpio_groups);

I know that we can bikeshed this until dawn of time, but we are dealing
here with data coming from the system firmware and a singleton device,
so it should be all available pretty early in boot sequence. I
understand we want to solve the "race" even though it is purely
theoretical, but we should be able to figure out what gpios are
supported and construct the groups array(s) before registering the
platform driver. Or do we see that runtime costs of constricting groups
dynamically outweigh space wasted by unused groups?

Thanks.

-- 
Dmitry

Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872921373
	for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 20:54:14 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id j3-20020a9d7683000000b005aeed94f4e9so2210876otl.6
        for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 12:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w7kYYicECLFYqJJp06iUhZt+dZdvmlULZGafsy+TJYY=;
        b=jZEz+rzkZ3qSK3QIGheoWaMmA3vav7COKy6XwkN2b1xZlR8w8uHw9DU+hsfVrKT2A1
         U+nJo9oYUOhKL2bluBtJc7uA2lL279nyzDvXpMQrF6jfqgRTzBzicWt8M5L7O24AeScr
         c3tANUX7ruj1tgsLIYaMxWfWfMHGFsBUoBh3oTqvs+HCxFWt0HI6kAvxv59aVIEjm5qB
         DHNii3B4lT65JyRyop8S4Ye+rYq8DgmRA7P6XT51vRvnKyAkiODRXBDabFIs6jRMkJ4R
         /Dzfvtw98dOOGyzT0mdluTBhkcSOBAFD5TjzwdK2k/Xz3Fluj/VsS40oZVY+YfhRh8J7
         CwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7kYYicECLFYqJJp06iUhZt+dZdvmlULZGafsy+TJYY=;
        b=cDAkMZ6dJFQ4eHwyaEOMdnxY4XmE0OXSbCR3H6EKDsRko1A7kwQ+8qPLR6lyYACuiu
         9EEN9W7v5n+K5NrC7qkWny0aAuMHdMAWn3L3KuDyhQdxCRF9QWnpvXm3YU1Tvpvrn86K
         xjmsNJ6eXqFuLibES43uOEFHpMVIsq3qLqvi6c5MzCAh52K8tKajfTuRmSZoao2skip3
         PBIoPlkYkhNxB9DFrUUtuqxDZI3lIaUXVewUcvlqqXuHCz4aJp30IQb0AyPJkoe9Paev
         s1x+d+IMcP4ZpjhIKrEYqHfl4Hmt2IBYaQFlGCLhsfuk40lZt3943VNvbC4MnQh0fZhm
         FR6w==
X-Gm-Message-State: AOAM533o68eE31HexizdYzNn/jw6/Z57qHbb7iWdltr0XtMS2dZCzwL/
	KppBMxO2GqpsntwPIhuACdRlYg==
X-Google-Smtp-Source: ABdhPJwqpinof7vCzpo3JsDgvR8WPsKLX9v8AOxpnybjdBazfy5rwg4vCIHUvilq1nJfyHr4S8hplQ==
X-Received: by 2002:a05:6830:1098:b0:5af:a452:2f17 with SMTP id y24-20020a056830109800b005afa4522f17mr1620669oto.175.1645736053623;
        Thu, 24 Feb 2022 12:54:13 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c8-20020a4ad788000000b0031ce69b1640sm191259oou.10.2022.02.24.12.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 12:54:13 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: linux-rockchip@lists.infradead.org,
	Lee Jones <lee.jones@linaro.org>,
	linux-mediatek@lists.infradead.org,
	Douglas Anderson <dianders@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Benson Leung <bleung@chromium.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-msm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: (subset) [PATCH 3/4] arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
Date: Thu, 24 Feb 2022 14:54:00 -0600
Message-Id: <164573604161.1471031.3877884989605040071.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com> <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Feb 2022 09:19:15 +0100, Krzysztof Kozlowski wrote:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> 

Applied, thanks!

[3/4] arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
      commit: 1e49defb863638cde53e48805747271f80f9abec

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>

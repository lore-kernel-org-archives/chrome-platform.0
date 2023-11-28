Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FFE495E9
	for <chrome-platform@lists.linux.dev>; Tue, 28 Nov 2023 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifHLiDek"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c9b9191722so6965831fa.1
        for <chrome-platform@lists.linux.dev>; Tue, 28 Nov 2023 09:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701190882; x=1701795682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lK2p/jNe186m6MQkZUw8vYHNpY87UOhpvk6tr8/V7o=;
        b=ifHLiDekHUlF2J1JgsuQzk1uuDLxuO3hGI/fNqm4QkmCL5qNW8lrc0fAI7Bir5HusH
         8Wu2IxrLkMxSbTfp9WQfgokhJD7jFNLdf3Ey1q9RbtGe78zyA8dBn3OYUYnHsjG+8Bjh
         Ek+ZLMYx2sVxul56iNUZU5WzcbyqZWh1GQar+kLmcN27tdN5uoctg/VHwtzaMVolKa/e
         gozOQskNOJNSWI5LEP4v/ENsZtF6NV84KZhEj7L6+bADOR2ppjzEaU9eeMLWDNa41tta
         v1N0H0f3oqzvbf3Kyg9uf7AuD5OBC+Bmj+wEP1vFlbOUrwnpSRKCfHcbVXTiR5h2+MTD
         v3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190882; x=1701795682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lK2p/jNe186m6MQkZUw8vYHNpY87UOhpvk6tr8/V7o=;
        b=axQUx3L/SzVilDhohGumusqy+vQQ10I+kFUqkPL4aIXLorSSvhgbdLViiYhPesYC7k
         uwYNBaEtUgXRhFPjN3aLQhCjC75SKhmbzR3laDs3sv1uWqawjcleuZi0wnj8KJ2ijqpA
         bC8scj1aBZfX4rE5iSTo1TUQPPmvCSBREqjkku6bjYN/JJm5HMB99hmhsKKXcABI/5vW
         w0PN6UwkXvEjIyIpppMVaJrqhKSm8LfCb+MLFAVkWK1eXY0BKuP9OKeP5GOiqKPKq6X4
         /lgzn1klpLpfb5Gso2LF1Kus6uXHBECLuzb2IdCbnxoECciYdgA++bO/bFyX7r7H2ttH
         DQZg==
X-Gm-Message-State: AOJu0YxKp13BB+pS2gzIJpIxpZGW6Eg0Ksn6LFwZ+1pA1YVtqW+qeFqW
	+rhYp0GxyjABKANQkqHUlO8=
X-Google-Smtp-Source: AGHT+IHUHm0IKPYOQJqLcMoENzn45m8AxBNvp1+QSlmWrXCEIuZk7di03TNpipCUVYLt57DtFkI7RQ==
X-Received: by 2002:a2e:95d6:0:b0:2c8:874b:8f19 with SMTP id y22-20020a2e95d6000000b002c8874b8f19mr10440648ljh.51.1701190881477;
        Tue, 28 Nov 2023 09:01:21 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b0040b32edf626sm12486784wmo.31.2023.11.28.09.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:01:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	kernel@pengutronix.de
Subject: Re: [PATCH] pwm: cros-ec: Drop unused member from driver private data
Date: Tue, 28 Nov 2023 17:59:58 +0100
Message-ID: <170119076359.215216.1319567862896668044.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116105212.650951-1-u.kleine-koenig@pengutronix.de>
References: <20231116105212.650951-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 16 Nov 2023 11:52:13 +0100, Uwe Kleine-König wrote:
> .dev is unused since the driver was introduced in commit 1f0d3bb02785
> ("pwm: Add ChromeOS EC PWM driver"). Drop it.
> 
> 

Applied, thanks!

[1/1] pwm: cros-ec: Drop unused member from driver private data
      commit: 53231af13df265cb46da99d5936ed270f22a35e1

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

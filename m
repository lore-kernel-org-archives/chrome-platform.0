Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA244A385C
	for <chrome-platform@lists.linux.dev>; Thu,  8 Oct 2026 13:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466863; cv=none; b=ddXmg9b+Po9WLgL6tWGXGGq3i9wz8YGQFPjCSCeenUFG89NXdmXa+cwrZf8mUtDJ3+53XZRqa245AMCWnyUNA61TXj4tMbkm5Iqk09FOpIgXWWYwdBoT6MhSBN5fM9Fzw9g4sikEnEqATk6IQ5pjejPp1wChEjSavaUKk6nNra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466863; c=relaxed/simple;
	bh=tGHlnuHJTeWYIp3qu8tuwMZO4/6oaJM9tZydKrag+ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+fq1yRPgogJRyGDR//8fuwId0EEotXp9hdbToFuaJSqSsraMWl/V6ybWupnV4UT79WMDr+5PHeg9dCO5CXAb7SPAlDXk/3vmnc0f6kctz44H2OOVKuQLAOEDWUtZz7o5yOtgsoGlICFtvFLSBXGDYKEp6Qyjs3BRStIFlfC0is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WkRKkMZL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WkRKkMZL"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c29c6a3930bso700269766b.3
        for <chrome-platform@lists.linux.dev>; Thu, 08 Oct 2026 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791466860; x=1792071660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sO6hhrGRCVa8MIRnUWaS8QVh61+fWOXs6meIqTfPD3c=;
        b=WkRKkMZL1pPc8/A2oGj7Y1mj4acaKx79Fsc4vOiRLR8NNpXNcNFKQiuzZl75UCvfj9
         7s9oylndftqQl1+Kptnl1XmMPb1npaaG/TpofmW+6M5plPDjm9kuh74pwmYYh4PiDBro
         /CczO4bqAYN2riUEvaXo62Mv2f8Gza8OjAySM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466860; x=1792071660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO6hhrGRCVa8MIRnUWaS8QVh61+fWOXs6meIqTfPD3c=;
        b=A9/VK7S3ts8EQN6R4UjBDve72RBDrugktGkFuy798gj7GexECG8TglkaRtxyzNxTQx
         y9QfHh2pac7GAQ9lLeCHWR72cdaR82CpTrfsk+oBspktaUhO6/K/J3a30dCzCqXM6+gt
         qO6DvYnsTl1X+ApFvA9Y9TcOAKIOB8LjftX5JygY/Jm6npgFEfFsYY4Z3dny4KhZgEAq
         aXOabSx5SQfiVcAGJ05hp3iNnlzM8PZfigtkk3YClRoY3wbSVXE5n42UNrTAQvUXJxT4
         fPaOoc2OMFs8K/rx2X2lfCH8CT2nFjBNzJVZbYuaaIE1sptMmEuABa1VIFZX94yuh5yh
         s5bw==
X-Gm-Message-State: AFuF++ktG4AwHa0qoq82m8kNIF/NoKLuXyDfDTdLeIIT/TghNDtwJKDM
	TXIRQBpNnj+gFArYtUG7rFP7YZQGMfLbiYL18+wd/YGDWHRBmukoT4vMxjvjWAauVg==
X-Gm-Gg: AYBFou3OZtzR99X4o3r0DPD/vjjDqkwhd1ktfKhLTf2TXunbQMxC9J76gxic1/bklJH
	coMLywgCvJqLaWmGiBqfMg/a1ucuZtFvijN/BlZqw2s+eK783CIA91T7/TOlNArJdxuJBGzO0KY
	qxAJs+kWXxiArAWFFvVLdUr89eydxP11bl2Pto4YL9TzxqrU8Nuoqfv4J+IKUYg3RIiJnrtX4ZK
	kI6Xaz85KXxPXayASZ91np6XNctGJftL4NTn8Uw0UuevdheM3GrD3L/7Yh7XSoAJD/C2CV0MEjq
	l7YtVR93UFMnCa3w9+h64KgH4qO9edneKeYriSy11o945ALJv3ZboEBsR4BVlfiZfRlVjVTwA5Q
	kaECBWkm772LARkzUZ4C5C8Okw9W4ZJaUTDXRYnY/M5ZN9OZxi6dT5WH96ztkUZBC45aE0faqAx
	V3YcwozkpNRjmIbWa4m29s+4THr01arBR+GxM8QtPyB69ctM1xLB0/L6lAvP04IUjUq9J/5BM+a
	qXCenmiwQYQyXSDBHmsuQNFkmfUw19IWimLhq962w==
X-Received: by 2002:a17:907:3cc9:b0:c2e:7da9:6e6 with SMTP id a640c23a62f3a-c317bda03f5mr518485166b.11.1791466859972;
        Thu, 08 Oct 2026 06:40:59 -0700 (PDT)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c31a0f4a144sm1035166b.35.2026.10.08.06.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:40:59 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/2] USB Type-C mode selection
Date: Thu,  8 Oct 2026 13:40:54 +0000
Message-ID: <20261008134056.3816556-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces priority-based alternate mode selection
support for cros_ec_typec. 
The base patch series and UCSI support was submitted here:
https://lore.kernel.org/all/20260119131824.2529334-1-akuchynski@chromium.org/

When AP-driven alternate mode selection is active, the driver enforces the
mode_selection bit for each registered Alternate Mode. This blocks
individual altmode drivers from self-activating. Once registration
completes, the driver evaluates USB4 capability. If USB4 is unsupported,
it falls back to priority-based negotiation via typec_mode_selection_start.

Additionally, we swap the registration sequence of the port's alternate
modes. Registering DisplayPort after Thunderbolt correctly ensures DP is
prioritized.

Changes in v2:
- Added this cover letter.
- Rebased on top of the latest platform-chrome tree.
- Tested on Redrix with Linux Fedora 7.3.0-rc5+.
v1 Link:
https://lore.kernel.org/all/20260129131928.794768-1-akuchynski@chromium.org/

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection
  platform/chrome: cros_ec_typec: Reorder altmode registration

 drivers/platform/chrome/cros_ec_typec.c      | 61 ++++++++++++++++----
 drivers/platform/chrome/cros_typec_altmode.c |  8 ++-
 2 files changed, 55 insertions(+), 14 deletions(-)

-- 
2.56.0.360.g66cac248cb-goog


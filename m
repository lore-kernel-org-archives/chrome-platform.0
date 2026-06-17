Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132FE43CECC
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692759; cv=none; b=WlqHsmrYx/kwkpKvPhCEVycKJJS3RYkfFdh2aWyKIPOVTNb7aXyXqFL0t8+nyJMO7vJHTND6JWqxA9MjxOBBPPKwl2kMM+11+u6sjfkVRp4GDBV1QTj7gtjEjwcF6DlJYxms0e8jMdhjHuhT8L8Aq41cBfqAFcFnO9pau55VaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692759; c=relaxed/simple;
	bh=jWPckIT7yObRKkib/4Fk7XwIGevaSZ223c7tQ+YT1gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFlknz3pjRz6IvJNMIxChi23Ip6VN9yS7ovKTo7VpN4NSL+H6rvucvKpakXDcVgu6CyLzyAghu8T1+yNmdTLsLeKKd/N0Il9aV7q1qHb5qvuU6dGZ9zlhHJ4XsUbKtb/K6l2yj5U1RoL7oAECwEzhsnSshGq3JAnPoELRwCyqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pqn+02SE; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqn+02SE"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so152211eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692757; x=1782297557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=pqn+02SEz1Poj7wj9PI2rMzRCPwupAKfNFyefH65CFheE1+JmtQqBzEsKPeEeIaKY0
         rkvwq4tPTYizSZgZWm+1cNtXHhtbG6el2ozB/40b800xKZ7Ol/I04mgJFgfk5oiVYXyB
         wWx159zkdtnHOnds9tQO9/NnK82oaeY63UNxvVE+a/ssZ8zHsWvfstimEuoprYNeDY1k
         hoWGO93ORkOK4BzSUBmvgI+91pB1SRLwa2kXdbLR1vLtYacnjbVWLIGJ20vpQBr3D0Iw
         Wb5m5DjQdnukg8KSTQH7QO9f/5on3If+rB2p8EsLPJtzgc27sr35FZtxyD3glkDnuNnx
         xf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692757; x=1782297557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=aKeYJMkE1/xmoj3vk9G91smqP8gVpRWkBeOXkYrRSvb326xNz3J3H60J7KqLbXtTZb
         8xElZjwbJImv2/WUFXh2zkMoAAeDul8QYI0/48TbAlKsyTq29/l683pbOX0hqgq9vPxw
         UIZ3mMb/BTT8tJbLGe6S9Pd4OWjUZgA8IuIi1ujr3LCM/RYPzl7r8wxcJPSgVFxFcDfZ
         M0IY8/ElfLx8pW2ud5Ik24VgZE8pt6B/NB175tyah/xUZ0I0Y616QY/9Yvlbpvi+bxwL
         KIQoV6kRnGX4UFT8CLCx7X90mPx34/edulGt5WWuoqow9zdFV06Wxe9f5WBK/DqrS4ob
         5axg==
X-Forwarded-Encrypted: i=1; AFNElJ9/mAbGsGFLXhUV99DnYbDIpavzRc8EozRXNKpORhG/jxoM2lP9XgTcvD5M4mS0vDbEUHVgSnCniYZ6iljE/zQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlVllWUH+z3dAMCWOiIxqe0xJiLFHhuoQm3oSa7SXoghSRKAI6
	WvkHx3Z/fq08JOZa0DISQudXnZqnc3hecovWtnG51nQFhxYmtzVyYi6G
X-Gm-Gg: AfdE7ckkUdM6HyVrUHMAiNXOa9UNAWoMdJNHiZ/nyYRhKeFn3Q2VNIAwi9oV3YkmAd8
	APCdZxgo+s+1KBFboQbo56zXizUs88uDCpNM1LOSyQIR7aBIsWBagjtlpfLlwUNFolOlDakpkYa
	f6UFN9+l0HGpx4DzwP42mqXZLgwb5dgYZVtwUe/ZHrlbngiFrDzAWAdHnophbkSKk2DjKVbfuas
	kgy6s6sLa00qsZfaLExQrb+WYiQGior8jLhq4Qh9/i0vNHmkplp73qx9Ff3GHBKtn5u7byJyiTC
	3iyeeQUDNoagdFSfWR0cW1enFrO0rBW0Zs6ygAuR4ZUaly6rCKCY6M1qhhEyFReQtV1vtxsq4U+
	SbebOgfXqvO0oo1tBlHOrJ5kwbHm+9c0/3eMUewK6VG9T41G9PFUISzpnGLz9igMXqGMCiaeyZ6
	h0dr8G4G3m4n27jIaYpyci7E7LU8CIPQh/K6qnH9KhKYHszPU=
X-Received: by 2002:a05:7300:50fa:b0:30b:bf84:18f8 with SMTP id 5a478bee46e88-30bcf08d54emr885755eec.8.1781692757235;
        Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 40/78] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:57 +0700
Message-ID: <20260617103235.449609-41-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/peb2466.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..ddbc5f34b08a 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1704,13 +1704,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1716,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0


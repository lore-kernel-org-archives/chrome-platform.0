Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978451B87FA
	for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 18:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560294; cv=none; b=u8NiaWV/AaFx0r2Yapu4RQgBLSNqFah0zGUV3Frae5N5INSfWg8Xn371mZG9jxVpxxanNMCxY58lccF8VQgRPhk2yApZaj9EA0s54irEt3V6hgjd9CpJgD2xQd2aYafMMhu2pCTTYbsFUyp7ttzFu+K7V9U5m3aL7I6FGozJpJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560294; c=relaxed/simple;
	bh=Q97WxV+deHkaj+EQZVZEyIuB9CBgjeEs11MlkDNh6d4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=POfxkhMdrQHD377jEGzr8ROLMy6g2Kvd4hcy2bTKmfaISpKLLjUOsu6yNmEpDe+JpCgqpgWUgwtI4FYSZVy6WAe8isEkzhr3T5Myw3EpFV9yojQ+tyBDbanVOIHR/BvTg8OZekF+VryEPoxhhOcvW3YK8K9ndgXviloDHGpDWJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O2xBfade; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dawidn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2xBfade"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38242a78f3eso2476691f8f.0
        for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 10:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732560291; x=1733165091; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KtpXYqsS0NdiYaBAh0AIOimkoXUPZvaUqei6YAtjyX8=;
        b=O2xBfadefeIKHo9jbPVD3K4tkZ3J0z13wfkcFHgA56ETTASwUEdrhsZSL8jM+Zx/hW
         mqhcSaKM/Z1AOy/xYVkl3nuYeRK2MpKwWMP8cxyIbRk3T8e4jcbEvLD883Co62P2i/hc
         a6m3gpxH9RJGM86P31vt3VZX73UVqBuHPtYT2YNyhLQsbm2+xlFhIgLw4Iimxfibp8kJ
         5wPcVE/BsBBcKPy4cGQtfexiKplToK6BSAusvl1qQcce++z9AlcIuG8OXvPHIZMNt8JO
         q5P1RS3OtG84EYcct/jOyblKOWM8Q6yLM+gP/81XzN7Qlf/VbqOWisyZmYoMiqDdGqNr
         stvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560291; x=1733165091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtpXYqsS0NdiYaBAh0AIOimkoXUPZvaUqei6YAtjyX8=;
        b=H7JN2WGehybpB36ncKdhSRj1ihyyeTmQeSbCM8exnx84K3OQwe2cvUorH8HEll56D0
         +X//HAiStYCuokPjTqT6vk0HJUbysKxNtkHglJRq4CEyLt9n+aUfpb2eSP/Bip9dxpF9
         du14/O30gBv7M2j7H2IYCta1UBqyhHPdPJjyncOM88vPPRrvOjRhig01kmIRSufrYhhv
         BSWO5o5YomHoGa0PP7zehDyw+uisFn52CPZaLnN/Sm0MtxvuIC8+4lYszi9PYQTutsYB
         0+zL3bSN/R3leVHhLPcWB2vHUkz8Lfk4xU2wikDU5wx2VYhVVwg14x4Z2Ie41sEb9pbe
         7bjw==
X-Gm-Message-State: AOJu0YzpOEEX5Ab38JPuTReE3chqfzr1dDfixtOCB19qQCYREk304rCs
	EjFH+JDi7GUIuEcihrmuo6QaXa9+rl7GCPaGy8VvB0Gmu0a4kSYorJL/jCl+Mr5WY+fA0HhKer0
	OUA==
X-Google-Smtp-Source: AGHT+IFqAgWsc3cSfksqwNnmQF3h9k00tU70CrRLdR8LZRHhlAR0EBWKX5d2hqziGMkGIQsHG3qViO4UmD0=
X-Received: from wrbfx7.prod.google.com ([2002:a05:6000:2d07:b0:382:4faa:76a])
 (user=dawidn job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:6487:0:b0:382:4725:7612
 with SMTP id ffacd0b85a97d-38260b4d4f1mr10781274f8f.4.1732560290920; Mon, 25
 Nov 2024 10:44:50 -0800 (PST)
Date: Mon, 25 Nov 2024 18:44:46 +0000
In-Reply-To: <20241125184446.1040187-1-dawidn@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241125184446.1040187-1-dawidn@google.com>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241125184446.1040187-2-dawidn@google.com>
Subject: [PATCH 2/2] platform/chrome: cros_ec_proto: remove unnecessary retries
From: Dawid Niedzwiecki <dawidn@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Dawid Niedzwiecki <dawidn@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove the retry of the get protocol info command. It is not needed
anymore, because RWSIG continue command is send before start of the
probing. That assures the EC device is ready in RW and there is no
need to try again because FPMCU is not fully booted.

Signed-off-by: Dawid Niedzwiecki <dawidn@google.com>
---
 drivers/platform/chrome/cros_ec_proto.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 4bd17ddefbd6..c7bb9ac87da8 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -366,15 +366,6 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 	msg->insize = sizeof(*info);
 
 	ret = cros_ec_send_command(ec_dev, msg);
-	/*
-	 * Send command once again when timeout occurred.
-	 * Fingerprint MCU (FPMCU) is restarted during system boot which
-	 * introduces small window in which FPMCU won't respond for any
-	 * messages sent by kernel. There is no need to wait before next
-	 * attempt because we waited at least EC_MSG_DEADLINE_MS.
-	 */
-	if (ret == -ETIMEDOUT)
-		ret = cros_ec_send_command(ec_dev, msg);
 
 	if (ret < 0) {
 		dev_dbg(ec_dev->dev,
-- 
2.47.0.371.ga323438b13-goog


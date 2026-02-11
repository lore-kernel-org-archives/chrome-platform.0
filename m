Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077034BA5B
	for <chrome-platform@lists.linux.dev>; Wed, 11 Feb 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770831268; cv=none; b=uTope8hQbqpFfKFqrWqA48qDVOFwTkIYhFnm44DM8qbD5X1oOlFUUGow97OjuhSuJiRYr6qJ2bHG6tW14Yn4f/A2WIgGAtau0k/ShpndC/RmSHZcUYWX5Cuv9bsqVHu3VALxIx0savyQuDQN3KEH8rby26uZO7rDs70O3lDj8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770831268; c=relaxed/simple;
	bh=B35W/wwKBO3Nf3zh7OtfXnLc3eCK7kEDavT8yq8z8ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUHcTg10Uo7i5PuVj7K0D4+/anT2Zl1Dnu/HPKBD11bFkNGKBcfvfsHiZ8zSTqkmeAgaUTsF3HY9iPX4/r8oP/DNNpTmuWfkw/RkFjHDGazdCvYImnzuCb3u5ZgLxUmvph7BS4XOJxDzyPzon9jggcQSiT0sDLLkpdES4zphYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ADGa8xKH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ADGa8xKH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-435f177a8f7so5367934f8f.1
        for <chrome-platform@lists.linux.dev>; Wed, 11 Feb 2026 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770831265; x=1771436065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXarn4uDm4FdMVdtkYEZm68FznhquSU537u2m3QOY98=;
        b=ADGa8xKHlm2e4GIhhhhq/aPf+dKaCBMAabIT+8G4dwd0BSA1tAXqAY/M8lSB9wocWa
         T8ZafbKeyFHq62NNrlnEWxCyaBPhH9uQoWXLJ5UdDYp5mMqg0Lzd1lD81MIBpP84mn8N
         r4mVByXocedlC1Qr9eBqTJx76zrx5ZSmjHFAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770831265; x=1771436065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IXarn4uDm4FdMVdtkYEZm68FznhquSU537u2m3QOY98=;
        b=Wc0E9H4mjIebBJqfe/tEeN3od2awnO+hrXP/FnXqnEH8skrZ6kk/rYRY+PffODyuBb
         apToX0hS5hGyI3Xpuq0dcSGk+UTOKD4WTcNFpBUCAjmEJMCR1dj43VI+LwGMNXj0/EZc
         YwTckosFndDdOwbYrA89fqATnBi1AX9DcGeXefPZ1nzB0nycnDCwSyW3OnRe4GHSXqYM
         P6WpmrZ8FGDmzX9+URhre6Tl9P6ZbNcuxXaE1ly+I5JuZO03YWFCMtyNQwz02DpvsUMq
         sGrUyAFii2wPk8+3a9z4+okwtyW0kyliQ5du1p6u40xuxUKsJH8Nx5WMptQkXx2DSpkG
         a2AA==
X-Forwarded-Encrypted: i=1; AJvYcCVUOrRG6JU9HLmrOK8OymV3jtA0Dro2wSfcWv5kUY5vYWMqqHJ0Cm52v8bBvlHTU5X43oScyZiHyIQr6bubR/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4UAHBAvfUpdI7ACuq7MO3NZCc7jQe9pCwzq1mVKRYe/6caOV5
	URt7WlVSqePN663OUE58KopePYAwLCFo5J5dVACWA9BWu6unopY44BEfir+yNfwFhA==
X-Gm-Gg: AZuq6aKiq2cTrTLMABsRoBWYEmjLT8xq9uzVpcxtQyckcBY7A5HXl1+9doRrgMsNUbX
	m7ezN/IWm1u/tCMeFSr3raw498ap4dI5KkaJGIcnWF2w3wiPvn49IjSP+0cEeA5Vs2SGrPwsHLl
	ohqtLnKkO+XgeXMiM8iVZZ2vZ1p9d7TH37NYsYlr8NBmEnYFHgd2sXGrS/Pu2Uw4iPgXEcezpMX
	sx47zQK09fIfYbujx8CtbbrrnBz8OvkN89hk9pVvMIaY9jcWCeCsid8y+2eQK6NTaT0HQU1wBCj
	P5VqYBITJpbwfh3NKO0wYx1BU9pUrEudsJg75kXfWqHGyyaglDerHqjDhw/W/lBKJOR+3qZg1kn
	yK3/g05gOS4xnchY1N31RSB0+NCcgKbPBPvbmvP23BLpojGh4QvuIY2BbujdHweno+j+IF1Hjdv
	M2veaDj0knK7dgWsUDeAffv/4pvds=
X-Received: by 2002:a05:6000:2c05:b0:435:e440:f518 with SMTP id ffacd0b85a97d-4378acb17dcmr384254f8f.54.1770831265487;
        Wed, 11 Feb 2026 09:34:25 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d50f24sm5885498f8f.14.2026.02.11.09.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 09:34:25 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] Input: export input_default_setkeycode
Date: Wed, 11 Feb 2026 17:34:20 +0000
Message-ID: <20260211173421.1206478-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
In-Reply-To: <20260211173421.1206478-1-fabiobaltieri@chromium.org>
References: <20260211173421.1206478-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export input_default_setkeycode so that a driver can set a custom
setkeycode handler to do take some driver specific action but still call
the default handler at some point.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 drivers/input/input.c | 9 ++++++---
 include/linux/input.h | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index a500e1e276c2..d3a1878f25db 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -800,14 +800,16 @@ static int input_default_getkeycode(struct input_dev *dev,
 	return 0;
 }
 
-static int input_default_setkeycode(struct input_dev *dev,
-				    const struct input_keymap_entry *ke,
-				    unsigned int *old_keycode)
+int input_default_setkeycode(struct input_dev *dev,
+			     const struct input_keymap_entry *ke,
+			     unsigned int *old_keycode)
 {
 	unsigned int index;
 	int error;
 	int i;
 
+	lockdep_assert_held(&dev->event_lock);
+
 	if (!dev->keycodesize)
 		return -EINVAL;
 
@@ -861,6 +863,7 @@ static int input_default_setkeycode(struct input_dev *dev,
 	__set_bit(ke->keycode, dev->keybit);
 	return 0;
 }
+EXPORT_SYMBOL(input_default_setkeycode);
 
 /**
  * input_get_keycode - retrieve keycode currently mapped to a given scancode
diff --git a/include/linux/input.h b/include/linux/input.h
index 7d7cb0593a63..06ca62328db1 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -517,6 +517,10 @@ INPUT_GENERATE_ABS_ACCESSORS(res, resolution)
 int input_scancode_to_scalar(const struct input_keymap_entry *ke,
 			     unsigned int *scancode);
 
+int input_default_setkeycode(struct input_dev *dev,
+			     const struct input_keymap_entry *ke,
+			     unsigned int *old_keycode);
+
 int input_get_keycode(struct input_dev *dev, struct input_keymap_entry *ke);
 int input_set_keycode(struct input_dev *dev,
 		      const struct input_keymap_entry *ke);
-- 
2.53.0.239.g8d8fc8a987-goog


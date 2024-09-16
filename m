Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816116A357
	for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726484461; cv=none; b=Re3MwOzYphGSmpxMGFzYknQQLbyDhBJPbYwqQ2qzrtGQ07qnOHAEJGjpDLlKyggK6w9UrbJM0ePInWMP2rqAKje8d5c2i+yLlvFzJydFZlgP6y18nOvPFAspI9R09YJQZvjX+kYEgrlDdRWQjzLXioXjY3OOuIZkWDkHUsUIPEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726484461; c=relaxed/simple;
	bh=zXDP/DixJ2nupvnmN46tVoLl7bcTa+g5Dd43FoS8g7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfGvTX6eaDms21SCap9AAuqncxDGt9FEn3jgcI8yvPp0cUImf53oaKBnCd83Ng+M9goDiHjR1E2ztlj5mIThgYDRlGC8NSLec6o5A0IcMkQHbRndsyeqRSEZZy5hcljakHuIT/An9UfIuHRKKlshvqGmywIqFcCKhbr48crHY9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EjYnroXb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EjYnroXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726484458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itSh3IrUxrdCZUhjcuF+BB5F77vjj4OFkn+g9OgH098=;
	b=EjYnroXbxwG388Kj/WlpGG6QOEXMMcA/Bsf2sSzd9yWTuRhyoN9idOiW3fIwVrqJZTCKmQ
	OM91+1m2GsNfnFUK0RwVDjFNbjicGMZ0f1gAyIqRPtLKqWhdFz5xeuDGNZnqMdCXS6xF+x
	PWGOlRUmMkNzMnzwBnMgSHn8RGRmECY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-fwL9iagwMp6NJFWwaWKqzA-1; Mon, 16 Sep 2024 07:00:57 -0400
X-MC-Unique: fwL9iagwMp6NJFWwaWKqzA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb2c5d634so21521595e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 04:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726484456; x=1727089256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itSh3IrUxrdCZUhjcuF+BB5F77vjj4OFkn+g9OgH098=;
        b=wfL/Inad8A0DVqTygJR7wSZR+3XRYN3LSXmRI0/52O5p8ikZmRfyVo++I88QTSmoyT
         b7jzVV12+EsuPiUfjhRQRJSuw3LxBi6wgBqQKMUVe5TAb9RAAn6n11E9xzMIRDZf2uCd
         H7iJX7legd2/NDDlxEZIFG6ITA/ugUQDhKdOxrWLW7h6Y1u4hqVv1fMY+CMpmIcNfHFT
         fWk/Q7vevwcrLKCrcYOI/k4vI6cXW6JxjMlSuEvqqZs+9BUk1a9pWv+4fka3AmkwAR1E
         yDiLDU+dyNwRiAK4twksJMlBMXwOeUpufr+dloalYeSyrVOLBtqspsoE5g3u6Tr8wA+Y
         dulg==
X-Forwarded-Encrypted: i=1; AJvYcCVE8I7dQ9mS5nGhYfCOEBLMQagk9bTaXcJm0cjR9gMqGa2YbW1lEf7N/310XpuqzddYnGWJX8ci2U2xYzRcXBM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM/gX/YsEKQXuXle3ta8UpWwB/TPdrmifEcGStdRVW0OakRRlc
	BBgWAXf/ceUeN/EzibwOqMM+50ZrG+oXjJus78Bo61vhbRBWEg2rFig/LjUgOztxz89poJQTkoV
	hBNhpvj6hNG+aBKQpFbmOiiU99gPjb0fEEtvD16rVxzsmdzL5IfNYXwpP4rOYm+l7PA==
X-Received: by 2002:a05:600c:310a:b0:42b:892d:54c0 with SMTP id 5b1f17b1804b1-42d907221b4mr59982975e9.12.1726484455960;
        Mon, 16 Sep 2024 04:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsgWHRJR4aKx2ppVUW3nxaeapfH3oj46/SJkQvNinWOePbqW+Lc2YXP1lXrRnZng63+W2aKg==
X-Received: by 2002:a05:600c:310a:b0:42b:892d:54c0 with SMTP id 5b1f17b1804b1-42d907221b4mr59982735e9.12.1726484455424;
        Mon, 16 Sep 2024 04:00:55 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b055069sm110260975e9.6.2024.09.16.04.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 04:00:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Brian Norris <briannorris@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Borislav Petkov <bp@alien8.de>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	chrome-platform@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	Hugues Bruant <hugues.bruant@gmail.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 1/2] firmware: sysfb: Add a sysfb_handles_screen_info() helper function
Date: Mon, 16 Sep 2024 13:00:25 +0200
Message-ID: <20240916110040.1688511-2-javierm@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916110040.1688511-1-javierm@redhat.com>
References: <20240916110040.1688511-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

That can be used by drivers to check if the Generic System Framebuffers
(sysfb) support can handle the data contained in the global screen_info.

Drivers might need this information to know if have to setup the system
framebuffer, or if they have to delegate this action to sysfb instead.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v4:
- New patch to add sysfb_handles_screen_info() helper (Thomas Zimmermann).

 drivers/firmware/sysfb.c | 19 +++++++++++++++++++
 include/linux/sysfb.h    |  7 +++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 02a07d3d0d40..770e74be14f3 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -77,6 +77,25 @@ void sysfb_disable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(sysfb_disable);
 
+/**
+ * sysfb_handles_screen_info() - reports if sysfb handles the global screen_info
+ *
+ * Callers can use sysfb_handles_screen_info() to determine whether the Generic
+ * System Framebuffers (sysfb) can handle the global screen_info data structure
+ * or not. Drivers might need this information to know if they have to setup the
+ * system framebuffer, or if they have to delegate this action to sysfb instead.
+ *
+ * Returns:
+ * True if sysfb handles the global screen_info data structure.
+ */
+bool sysfb_handles_screen_info(void)
+{
+	const struct screen_info *si = &screen_info;
+
+	return !!screen_info_video_type(si);
+}
+EXPORT_SYMBOL_GPL(sysfb_handles_screen_info);
+
 #if defined(CONFIG_PCI)
 static bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
 {
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index bef5f06a91de..07cbab516942 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -60,12 +60,19 @@ struct efifb_dmi_info {
 
 void sysfb_disable(struct device *dev);
 
+bool sysfb_handles_screen_info(void);
+
 #else /* CONFIG_SYSFB */
 
 static inline void sysfb_disable(struct device *dev)
 {
 }
 
+static inline bool sysfb_handles_screen_info(void)
+{
+	return false;
+}
+
 #endif /* CONFIG_SYSFB */
 
 #ifdef CONFIG_EFI
-- 
2.46.0


Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4121217656
	for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323753; cv=none; b=Ji3y+7X+hcMVo2GfQeGIG5n2Vjr/uUFuBVoVR1j/a7pyCvCgyB/EWojLmJTZqrvkr+gOt7nE3Ctzi8IELDrD7M6qyd16K8EebwPnce9tY2U/t7jEmuYxyDP8UarIZ17NPADAKp+43Dl7w18Q8lDXrmuoNWSc0MG4v9IjTuqzkOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323753; c=relaxed/simple;
	bh=wmoTH6RDMvSrIitc+RyQ8z5eGj/rSYnzG0QzoUpsshA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrpJWtiT0S+WfboorblLXqG4AOED7GgkCxQfgcyg9o/dvysudub30JNl1LH+ONawH/CUYGXEIaGrfl6uBdaGq6bAbtdJfvDVZXAXkrumapFvLY3qDpMteFkAGfXzuGVlRi1wbS5+INhuryC7deBU7de+Qvx+B3DKHxlEqtxC9O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TEDwmGZp; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TEDwmGZp"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db54269325so259693a12.2
        for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 14:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730323750; x=1730928550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcJ6rYdsw1OyRONz4zGVh02ld/8YsK6wUyzfWA/Y9e4=;
        b=TEDwmGZp5KodxncMmIK89t/M73lwj3Nw7M7gA3wsgZ95CA31vO4IHTbBRoxpV0r/bI
         1NVfERssBbbcSoFO6FsZUh/K0uoddB/H0A5dj+ZrTukSfgkmEbgtYD3DhO8PX9iyuxE9
         knqM82586ijPWQfed75LP8NUuIYmUkTmPRuy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323750; x=1730928550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcJ6rYdsw1OyRONz4zGVh02ld/8YsK6wUyzfWA/Y9e4=;
        b=FuouHuL3s2jT5lhkblh/0upn7OhKeb+YtiqIOOFbrhlmtPPpqbooZKz6ashNLSBDf3
         NMWU4Ms4sBrMsn6hdi2gcarIkjH6Gz+s/Yhs3vYlJ7XsDuzuC0+Jd8qOdUAgEH6aX7+7
         xHTq7Mp4e3t5W8Lnr++7Szo8sRbJSdXnykygYgkjV7FMgVD2zQiMCQDK1/VKJvIB5SIe
         OLcv4I6HqD1u7QGBHIdSAYTYgiiOdIhbthWRL4f4aXDzForTQMpFE/B8WsulQKOfQa04
         KVSnLfUXX77qpOYaQO8qL3QOMQuq/6Iq9dKKRE15rrQzYYKoPbRYjTy8CsWw2gzPt6zM
         M4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW1y9e9tnyE7R/FbbF3kzOQoQcXm4kar4pBLgZnRtmNhnu6OGCXtUUdoT6xBBI8QQtKoWTSdl8q/nxQqI+nzoU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzuPsMnX9+bkTZROSyCGgHM1nZbI1YUIyYbHrhGlWlhLFXe5Zz
	OpX8wFy6UTuBVt8SFlbogwXd9rpXYDIw72fk6WQnNipKa26IecFJtFtb0/WJRg==
X-Google-Smtp-Source: AGHT+IHxkwiPUzOjIQu7smhe9Fr6RzmKM9yzxhOhZb+U58++hpr/bZMA54sfwCVhxTtriq/TmBMRSA==
X-Received: by 2002:a05:6a21:3984:b0:1d8:a759:524d with SMTP id adf61e73a8af0-1d9a83d60cfmr20785025637.18.1730323750045;
        Wed, 30 Oct 2024 14:29:10 -0700 (PDT)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-720bc2eb76esm76989b3a.154.2024.10.30.14.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 14:29:09 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: dmitry.baryshkov@linaro.org,
	jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] usb: typec: Auto enter control for alternate modes
Date: Wed, 30 Oct 2024 14:28:34 -0700
Message-ID: <20241030142833.v2.3.I439cffc7bf76d94f5850eb85980f1197c4f9154c@changeid>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030212854.998318-1-abhishekpandit@chromium.org>
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add controls for whether an alternate mode is automatically entered when
a partner connects. The auto_enter control is only available on ports
and applies immediately after a partner connects. The default behavior
is to enable auto enter and drivers must explicitly disable it.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v1)

 Documentation/ABI/testing/sysfs-bus-typec |  9 +++++++
 drivers/usb/typec/altmodes/displayport.c  |  6 +++--
 drivers/usb/typec/altmodes/thunderbolt.c  |  3 ++-
 drivers/usb/typec/class.c                 | 31 +++++++++++++++++++++++
 include/linux/usb/typec.h                 |  2 ++
 include/linux/usb/typec_altmode.h         |  2 ++
 6 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-typec b/Documentation/ABI/testing/sysfs-bus-typec
index 205d9c91e2e1..f09d05727b82 100644
--- a/Documentation/ABI/testing/sysfs-bus-typec
+++ b/Documentation/ABI/testing/sysfs-bus-typec
@@ -12,6 +12,15 @@ Description:
 
 		Valid values are boolean.
 
+What:		/sys/bus/typec/devices/.../auto_enter
+Date:		September 2024
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Controls whether a mode will be automatically entered when a partner is
+		connected.
+
+		This field is only valid and displayed on a port. Valid values are boolean.
+
 What:		/sys/bus/typec/devices/.../description
 Date:		July 2018
 Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 2f03190a9873..62263f1d3a72 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -767,8 +767,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
-	dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
-	schedule_work(&dp->work);
+	if (port->auto_enter) {
+		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
+		schedule_work(&dp->work);
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 8380b22d26a7..181892bf1225 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -212,6 +212,7 @@ static const struct typec_altmode_ops tbt_altmode_ops = {
 
 static int tbt_altmode_probe(struct typec_altmode *alt)
 {
+	const struct typec_altmode *port = typec_altmode_get_partner(alt);
 	struct tbt_altmode *tbt;
 
 	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
@@ -226,7 +227,7 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
 	typec_altmode_set_drvdata(alt, tbt);
 	typec_altmode_set_ops(alt, &tbt_altmode_ops);
 
-	if (tbt_ready(alt)) {
+	if (port->auto_enter && tbt_ready(alt)) {
 		if (tbt->plug[TYPEC_PLUG_SOP_PP])
 			tbt->state = TBT_STATE_SOP_PP_ENTER;
 		else if (tbt->plug[TYPEC_PLUG_SOP_P])
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 85494b9f7502..e74f835c6859 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -403,6 +403,31 @@ static ssize_t active_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(active);
 
+static ssize_t
+auto_enter_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct typec_altmode *alt = to_typec_altmode(dev);
+
+	return sprintf(buf, "%s\n", alt->auto_enter ? "yes" : "no");
+}
+
+static ssize_t auto_enter_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t size)
+{
+	struct typec_altmode *adev = to_typec_altmode(dev);
+	bool auto_enter;
+	int ret;
+
+	ret = kstrtobool(buf, &auto_enter);
+	if (ret)
+		return ret;
+
+	adev->auto_enter = auto_enter;
+
+	return size;
+}
+static DEVICE_ATTR_RW(auto_enter);
+
 static ssize_t
 supported_roles_show(struct device *dev, struct device_attribute *attr,
 		     char *buf)
@@ -446,6 +471,7 @@ static DEVICE_ATTR_RO(svid);
 
 static struct attribute *typec_altmode_attrs[] = {
 	&dev_attr_active.attr,
+	&dev_attr_auto_enter.attr,
 	&dev_attr_mode.attr,
 	&dev_attr_svid.attr,
 	&dev_attr_vdo.attr,
@@ -461,6 +487,10 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 		if (!adev->ops || !adev->ops->activate)
 			return 0444;
 
+	if (attr == &dev_attr_auto_enter.attr)
+		if (!is_typec_port(adev->dev.parent))
+			return 0;
+
 	return attr->mode;
 }
 
@@ -564,6 +594,7 @@ typec_register_altmode(struct device *parent,
 	if (is_port) {
 		alt->attrs[3] = &dev_attr_supported_roles.attr;
 		alt->adev.active = true; /* Enabled by default */
+		alt->adev.auto_enter = !desc->no_auto_enter;
 	}
 
 	sprintf(alt->group_name, "mode%d", desc->mode);
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index d616b8807000..5336b7c92ca4 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -139,6 +139,7 @@ int typec_cable_set_identity(struct typec_cable *cable);
  * @svid: Standard or Vendor ID
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
+ * @no_auto_enter: Only for ports. Disables auto enter which is default behavior.
  * @roles: Only for ports. DRP if the mode is available in both roles
  *
  * Description of an Alternate Mode which a connector, cable plug or partner
@@ -148,6 +149,7 @@ struct typec_altmode_desc {
 	u16			svid;
 	u8			mode;
 	u32			vdo;
+	bool			no_auto_enter;
 	/* Only used with ports */
 	enum typec_port_data	roles;
 };
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..ab7c3ebe4926 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -18,6 +18,7 @@ struct typec_altmode_ops;
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @active: Tells has the mode been entered or not
+ * @auto_enter: Tells whether to auto-enter mode (only valid for port mode).
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
@@ -28,6 +29,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	unsigned int			auto_enter:1;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.47.0.163.g1226f6d8fa-goog


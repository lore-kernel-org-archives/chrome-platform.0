Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E121A5B92
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073121; cv=none; b=bXC6h+AabQJvYOWQ2MXrQ6ZXE3VzWVqIyYPzT1SPFVdoeRBXtMeuyoXUt1CVMgbM0fBf+Pi90+rkwvNJaY+IdtjVJPgnXdZVV7k3KgPZI7KW5OuqPgDEQNTtOs8C8rtqYxniATt87j+CVv1MDgMrDqNc0gSnr1JDfof4sMmzjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073121; c=relaxed/simple;
	bh=sHa9BBbst3LIM8YdlziE31qoagyYY43dY3E9jsh+AS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+QUU9Bv9eIQkppfqlDTl0c1U7R03YqK54WIAp3iBUflFjXbBPOUKErX4yI0tcoATVM1GJW23W8NRRWY06prV/56sbA53JaqSHzwvMmNgJyC79OoXnkZVyQpQ/L3NR2bfB3B8ITdoid9tQ+SYiWsNnHsVGIsytpTpdUkuDJ52jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sW6vWA8o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sW6vWA8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63DEC4CEF5;
	Mon, 21 Jul 2025 04:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073120;
	bh=sHa9BBbst3LIM8YdlziE31qoagyYY43dY3E9jsh+AS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sW6vWA8o4WOu4WQLArsrSUXVZs7SMvq5+ig6UDRLsRPWwo3FKu57Z3yRwIFdQmJGC
	 4j2zCPF8yyigKajxQw/jpBElJi+/GOeJajawPrEK07wih7bp2Rzg6hR0kI+wgSB5W1
	 Nj7/MPsW2ewPubHY79ygGixaPfoFG1N4WEr/G7X0EpwSInRwhR61Dwu3/92nHjuzH8
	 7jZDpn0erBDekTHTEDXUdKeRK9MtMJl9bSFQvVu+2OoaNjiGoSTyhLH6p6xkqpwrE2
	 1QA4Sd5j4Odh8+uwSe8nH35gVlroypb0e6CEOfjIe4kjKkWpjQxplcsYBOMtCIG+1W
	 y9Y68U9eT1wLA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 1/8] platform/chrome: cros_ec_chardev: Remove redundant struct field
Date: Mon, 21 Jul 2025 04:44:49 +0000
Message-ID: <20250721044456.2736300-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250721044456.2736300-1-tzungbi@kernel.org>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`ec_dev` in the `struct chardev_data` is unused.  Remove the field
and the whole struct as well.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes since v1 (https://patchwork.kernel.org/project/chrome-platform/patch/20250703113509.2511758-2-tzungbi@kernel.org/).

 drivers/platform/chrome/cros_ec_chardev.c | 28 +++++++++--------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 21a484385fc5..5c858d30dd52 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -31,11 +31,6 @@
 /* Arbitrary bounded size for the event queue */
 #define CROS_MAX_EVENT_LEN	PAGE_SIZE
 
-struct chardev_data {
-	struct cros_ec_dev *ec_dev;
-	struct miscdevice misc;
-};
-
 struct chardev_priv {
 	struct cros_ec_dev *ec_dev;
 	struct notifier_block notifier;
@@ -379,29 +374,28 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_platform *ec_platform = dev_get_platdata(ec_dev->dev);
-	struct chardev_data *data;
+	struct miscdevice *misc;
 
 	/* Create a char device: we want to create it anew */
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
+	misc = devm_kzalloc(&pdev->dev, sizeof(*misc), GFP_KERNEL);
+	if (!misc)
 		return -ENOMEM;
 
-	data->ec_dev = ec_dev;
-	data->misc.minor = MISC_DYNAMIC_MINOR;
-	data->misc.fops = &chardev_fops;
-	data->misc.name = ec_platform->ec_name;
-	data->misc.parent = pdev->dev.parent;
+	misc->minor = MISC_DYNAMIC_MINOR;
+	misc->fops = &chardev_fops;
+	misc->name = ec_platform->ec_name;
+	misc->parent = pdev->dev.parent;
 
-	dev_set_drvdata(&pdev->dev, data);
+	dev_set_drvdata(&pdev->dev, misc);
 
-	return misc_register(&data->misc);
+	return misc_register(misc);
 }
 
 static void cros_ec_chardev_remove(struct platform_device *pdev)
 {
-	struct chardev_data *data = dev_get_drvdata(&pdev->dev);
+	struct miscdevice *misc = dev_get_drvdata(&pdev->dev);
 
-	misc_deregister(&data->misc);
+	misc_deregister(misc);
 }
 
 static const struct platform_device_id cros_ec_chardev_id[] = {
-- 
2.50.0.727.gbf7dc18ff4-goog


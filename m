Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FF9354F6
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 05:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2CU4PUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1137C433C7;
	Wed, 11 Oct 2023 05:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697002167;
	bh=BtRpaJnEUmSFqH6S3+yY1QCSGW5jXrGVl+Jiv3fsAf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2CU4PUH0+lsZ0+D6kCB89pZIYZPyBDHRtI1DMYx0QSzpt4EioiDotQeJHk3qJe9u
	 RoGpk7NzQ1gZISD1Zw8CTr0wugAp/3HOqsWMxzY09f0F6Au65v0kUV8BpZJ7Rz0C5p
	 W8R6dA1azVMt7lrPeqGEN8rpRL36jLaz17zdTWx5aFsAL/v9cdbf/RrFu6QhNtrXAW
	 M3VrZqJ054GaRgMqcPxuo6Em1Q9sHCIbTJwVI8HGUN/eBnHqvShmsCEOLOiBudXoeb
	 ExvV0iv4LVgJ0e6P+l8K+vOqiFLnd3rZ33AfHME4k1lhkYr7jphhASaYHRE2IZ/UTD
	 7zZ8z/7wrp6tw==
Date: Wed, 11 Oct 2023 13:29:24 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v1 1/4] cros_ec_lpc: introduce cros_ec_lpc, a priv struct
 for the lpc device
Message-ID: <ZSYytBNTll6YbPBX@google.com>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231005160701.19987-3-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005160701.19987-3-dustin@howett.net>

On Thu, Oct 05, 2023 at 11:06:59AM -0500, Dustin L. Howett wrote:
> @@ -423,6 +439,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
>  	ec_dev->din_size = sizeof(struct ec_host_response) +
>  			   sizeof(struct ec_response_get_protocol_info);
>  	ec_dev->dout_size = sizeof(struct ec_host_request);
> +	ec_dev->priv = (void *)ec_lpc;

Does it really need the cast?

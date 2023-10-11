Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5681354F6
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 05:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJdkMf5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8330AC433C7;
	Wed, 11 Oct 2023 05:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697002246;
	bh=4mehzhKZqDM9HTXPbD3vMlkxxi861o1MERxPCh0Kbu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJdkMf5JP8J7gAVWIbCdjwFP1QEwjW1UTZ4BUjDHsW9ZSYfyTSFWwaXURH31QDmxx
	 A0+VIGX3RhZTv7WQzV8EeroO9V2hB98bAHsWHPhl6NzqHO/AF24rQtbuqJQ4uomwAB
	 Qotal8dZ4B74JRQcK5BKbRK4rRaEUqp420wcnn5uW/Mb6o38yZpAXWyclWoeVj4Nnl
	 kAJjuItQ5gU4y2FbZ1+rieiIZKzQEpVcEh9tCt1mWKtvCkZv+pGSKYjS5awAshG/T6
	 PYxCUyZi16Lb/f+wIE/RHbx0Zaz+PdAc7uumtML0LTyUlsUD2fcNy6aDRIasi8BkOF
	 0heMnMHh6WYxA==
Date: Wed, 11 Oct 2023 13:30:43 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v1 4/4] cros_ec_lpc: add quirks for the Framework Laptop
Message-ID: <ZSYzA7AW2YY1MmAI@google.com>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231005160701.19987-6-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005160701.19987-6-dustin@howett.net>

On Thu, Oct 05, 2023 at 11:07:02AM -0500, Dustin L. Howett wrote:
> @@ -596,6 +603,7 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop"),
>  		},
> +		.driver_data = (void *)&framework_laptop_lpc_driver_data,

Does it really need the cast?

How about the devices with MEC?  It looks like all Framework Laptop applies
the quirks by the patch.

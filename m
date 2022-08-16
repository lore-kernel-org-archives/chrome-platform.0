Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0151C32
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 05:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60262C433D6;
	Tue, 16 Aug 2022 05:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660626762;
	bh=PyvgnXmrmnbT6B4C9lNYxGIRrb3s7yATU2so3O1O4GA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCiHeYSktAemVxbfn+FEU16LXFFvTN16+XtYCsKKQGvcdeH6Z6XglzATRLrryOGt8
	 2CIA1xuIfUOXqKlI2TzpuL8tBbuJ3ySTp1UA7MsIvz9kHGW9+u9fzQttn8T5oo9KLT
	 43NCEQDnHl7WG7YmeMPV7EDwj6kfQaJVbdQ7DsiwO2E3OFGPTF3wd8amY4GsaNzwS5
	 YwRwaKdF4EGorMXXtkAA4zuPBcQXUpcJkkXNMHWRCN0c+Qtjkfhf5fhjnaWJO6BIDv
	 Sm0Ns1oLzPqPzar5YWIwayb/BhVxPtN0c6TB5Hx70Sp9cP17vcbKwBnk9hRlC+HE09
	 HJ3YV9XnacyTg==
Date: Tue, 16 Aug 2022 05:12:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH v5 5/7] platform/chrome: cros_typec_switch: Register mode
 switches
Message-ID: <YvsnRXLVbcI+McEo@google.com>
References: <20220815063555.1384505-1-pmalani@chromium.org>
 <20220815063555.1384505-6-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815063555.1384505-6-pmalani@chromium.org>

On Mon, Aug 15, 2022 at 06:34:26AM +0000, Prashant Malani wrote:
> Register mode switch devices for Type C connectors, when they are
> specified by firmware. These control Type C configuration for any USB
> Type-C mode switches (sometimes known as "muxes") which are controlled
> by the Chrome EC.

To be consistent to the commit message, s/Type C/Type-C/g.

To be consistent to the series, I guess you would like to use ChromeOS
instead of Chrome?

> @@ -235,6 +264,17 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
>  		}
>  
>  		dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
> +
> +		if (!fwnode_property_read_bool(fwnode, "mode-switch"))
> +			continue;

Would it be better to use device_property_present()?

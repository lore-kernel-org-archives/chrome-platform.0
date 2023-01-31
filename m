Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CF8629
	for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 03:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162E4C433A1;
	Tue, 31 Jan 2023 03:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675135186;
	bh=1NQ1Fbrb6bK/cTYJdpO49DSrf2htZos9hMzLNdyHHg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t06pJJocpsUJTxA5t1KZeruxfokw32eTe9R4I2X/JBA66H07qrpcj/ARP1YqY7waO
	 99biYH5CNAKLb6dkkWehRiaINaPJN6aEfiLRxqYJl7K1lqcwEoVmMiRLFXLKhBWGJE
	 S6ZQ6WNIvLSBDbLVcotYtcaY1JnY72F9D8c9TpkcaVbjrpRslSvJFBqSyL8FoWdd2p
	 RCnE+naOzinwPiNoBnU3K78Mt3j3r401JGg2lt26pLq2usGZ58ZzMAf61QJRgrFCB1
	 sThCToXf+tpL+qULX7fgIRKlXRPJKuPz4LhsFVjJrz13GHa7y5wCBbBNba/zc3cyPZ
	 oSq9/JUllWGSQ==
Date: Tue, 31 Jan 2023 11:19:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec: Add VDM attention headers
Message-ID: <Y9iIzcz5AGjVXsNG@google.com>
References: <20230126205620.3714994-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126205620.3714994-1-pmalani@chromium.org>

On Thu, Jan 26, 2023 at 08:55:45PM +0000, Prashant Malani wrote:
> Incorporate updates to the EC headers to support the retrieval of VDM
> Attention messages from port partners. These headers are already present
> in the ChromeOS EC codebase. [1]
> 
> [1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:include/ec_commands.h
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

With a nit:
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index b9c4a3964247..ec327638c6eb 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -5862,6 +5862,7 @@ enum tcpc_cc_polarity {
>  #define PD_STATUS_EVENT_MUX_1_SET_DONE		BIT(5)
>  #define PD_STATUS_EVENT_VDM_REQ_REPLY		BIT(6)
>  #define PD_STATUS_EVENT_VDM_REQ_FAILED		BIT(7)
> +#define PD_STATUS_EVENT_VDM_ATTENTION			BIT(8)

This has an extra tab if comparing with others around.

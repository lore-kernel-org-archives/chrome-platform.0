Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454A427124
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 17:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88213C433C7;
	Thu, 27 Jul 2023 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690477793;
	bh=Ky/oluIzHCEeuhuElQC9U6jY75TgLuPVRTngDIASvjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tV37aRq3EnmJ9lKNBvRBBvsJcANZbaisFqMyrl2Pi3tWcwWt18y03vrvM9t5FKEk1
	 Rl2/hqSCp3MrBcDSdvTjpGkYTdPmzmXE1L5NwlutDlmd9t4OfapibIqrZitsxA/HH/
	 /LG4PLGudZsTrq0m5vXi1bZ3nGWoSvAXkxCBC2o11jKkYuSQE1xiQjpMFLDO+bByk3
	 GoIz9nFIM43fkkTCYGgbdNWbDUp/AbK8mgEyboS+emJNvBbvKmjCxukQ22Pwd+5+2J
	 +RNRSUTAAYm6mwokdZvQGBU3TQBa/uZqp80HzgudzpTStjB0DxSYsDWkPLybPYap7a
	 1zS3Q+X2UWTPA==
Received: (nullmailer pid 1835903 invoked by uid 1000);
	Thu, 27 Jul 2023 17:09:51 -0000
Date: Thu, 27 Jul 2023 11:09:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <groeck@chromium.org>, Prashant Malani <pmalani@chromium.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Wayne Chang <waynec@nvidia.com>, Benson Leung <bleung@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2] dt-bindings: usb: connector: disallow additional
 properties
Message-ID: <169047762815.1817455.10294109902961650429.robh@kernel.org>
References: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>


On Tue, 25 Jul 2023 12:23:25 +0200, Krzysztof Kozlowski wrote:
> USB connector bindings is complete, thus no additional properties should
> be allowed.  Add missing 'reg' property and change additionalProperties
> to false, so the schema will check for anything not unexpected.  This
> also allows to drop the 'reg' from other bindings referencing the
> usb-connector.yaml and make it required.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Make usb-connector.yaml additionalProperties:false (Rob)
> 
> v1:
> https://lore.kernel.org/all/20230723071105.40157-1-krzysztof.kozlowski@linaro.org/
> ---
>  .../devicetree/bindings/chrome/google,cros-ec-typec.yaml    | 6 ++----
>  .../devicetree/bindings/connector/usb-connector.yaml        | 5 ++++-
>  .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml       | 6 ------
>  Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 6 ++----
>  4 files changed, 8 insertions(+), 15 deletions(-)
> 

I didn't not fix the double negative and applied, thanks! ;)

